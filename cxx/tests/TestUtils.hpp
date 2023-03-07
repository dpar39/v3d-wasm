#pragma once

#include <string>

namespace v3d {

std::string resolvePath(const std::string & relPath);

std::string pathCombine(const std::string & prefix, const std::string & suffix);

} // namespace v3d