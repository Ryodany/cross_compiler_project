#pragma once
#include "export.h"

#include <vector>
#include <string>

class LIB_EXPORT Core
{
public:
	std::vector<std::string> m_vals;

	Core(const std::string &t) 
	{
		m_vals.push_back(t);
    }
};

struct Data
{
	uint16_t year;
	std::string city;
};

LIB_EXPORT Data buildData(uint16_t y, const std::string &city);
