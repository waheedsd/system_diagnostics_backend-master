const winston = require('winston');
const moment = require('moment-timezone');

// Define the logger configuration
const logger = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(), // Add a timestamp to the log message
    winston.format.printf(({ timestamp, message }) => {
      const localTimestamp = moment(timestamp).tz('Asia/Kolkata').format('YYYY-MM-DD HH:mm:ss');
      return `${localTimestamp}: ${message}`;
    })
  ),
  transports: [
      new winston.transports.Console(), // Output the log to the console
      new winston.transports.File({ filename: 'systemDiagnosticinfo.log' }) // Output logs to a file
  ]
});



module.exports = logger;