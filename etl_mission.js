import mysql from "mysql2/promise";

const source = await mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "space_mission_oltp",
});

const target = await mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "space_mission_dw",
});

const [missions] = await source.query(`
  SELECT m.mission_id, m.mission_name, a.agency_id, s.spacecraft_id,
         d.destination_id, m.launch_date,
         YEAR(m.launch_date) AS year,
         MONTH(m.launch_date) AS month,
         DAY(m.launch_date) AS day,
         AVG(t.temperature) AS avg_temp,
         AVG(t.signal_strength) AS avg_signal,
         m.duration_days, m.status
  FROM missions m
  JOIN agencies a ON m.agency_id = a.agency_id
  JOIN spacecrafts s ON m.spacecraft_id = s.spacecraft_id
  JOIN destinations d ON m.destination_id = d.destination_id
  LEFT JOIN telemetry_data t ON t.mission_id = m.mission_id
  GROUP BY m.mission_id;
`);

for (const m of missions) {
  const date_key = parseInt(
    `${m.year}${String(m.month).padStart(2, "0")}${String(m.day).padStart(
      2,
      "0"
    )}`
  );

  const launchDate = new Date(m.launch_date);
  const dayOfWeek = launchDate.toLocaleString("en-US", { weekday: "long" });
  const isWeekend = dayOfWeek === "Saturday" || dayOfWeek === "Sunday" ? 1 : 0;
  const quarter = Math.ceil(m.month / 3);

  await target.query("REPLACE INTO dim_mission VALUES (?, ?)", [
    m.mission_id,
    m.mission_name,
  ]);
  await target.query("REPLACE INTO dim_agency VALUES (?, ?, ?)", [
    m.agency_id,
    "NASA",
    "USA",
  ]);
  await target.query("REPLACE INTO dim_spacecraft VALUES (?, ?, ?)", [
    m.spacecraft_id,
    "Rover",
    "Robot",
  ]);
  await target.query("REPLACE INTO dim_destination VALUES (?, ?, ?)", [
    m.destination_id,
    "Mars",
    "Planet",
  ]);

  await target.query(
    `
    REPLACE INTO dim_date (date_key, launch_date, launch_year, launch_quarter, launch_month, launch_day, day_of_week, is_weekend)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `,
    [
      date_key,
      m.launch_date,
      m.year,
      quarter,
      m.month,
      m.day,
      dayOfWeek,
      isWeekend,
    ]
  );

  await target.query(
    `
    INSERT INTO fact_mission_performance
    (mission_key, agency_key, spacecraft_key, destination_key, date_key,
     avg_temperature, avg_signal_strength, duration_days, mission_status)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  `,
    [
      m.mission_id,
      m.agency_id,
      m.spacecraft_id,
      m.destination_id,
      date_key,
      m.avg_temp,
      m.avg_signal,
      m.duration_days,
      m.status,
    ]
  );
}

console.log("ETL misi antariksa tuntung.");
process.exit();
