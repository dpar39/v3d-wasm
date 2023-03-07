#include "TestUtils.hpp"
#include <filesystem>

namespace fs = std::filesystem;

namespace v3d {
std::string resolvePath(const std::string & relPath)
{
    for (auto baseDir : { fs::current_path(), fs::path("/src") }) {
        while (baseDir.has_parent_path()) {
            auto combinePath = baseDir / relPath;
            if (exists(combinePath)) {
                return combinePath.string();
            }
            if (baseDir == baseDir.parent_path()) {
                break;
            }
            baseDir = baseDir.parent_path();
        }
    }
    return {};
}

std::string pathCombine(const std::string & prefix, const std::string & suffix)
{
    return (fs::path(prefix) / fs::path(suffix)).string();
}
} // namespace v3d