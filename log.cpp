#include "log.hpp"

src::severity_logger< severity_level > slg;

void log_init()
{
	logging::add_file_log(
		keywords::file_name = "sample_%N.log",
		keywords::format =
			(
				expr::stream
				<< expr::format_date_time< boost::posix_time::ptime >("TimeStamp", "%Y-%m-%d %H:%M:%S")
				<< " "
				<< expr::attr< unsigned int >("LineID")
				<< ": <" << expr::attr< severity_level >("Severity")
				<< "> " << expr::smessage
			)
		);
	logging::add_common_attributes();
}


