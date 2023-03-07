#include "Engine.hpp"

#include <Eigen/Dense>

#include "geometrycentral/surface/exact_geodesics.h"

using namespace geometrycentral::surface;

namespace v3d {
Engine::Engine() = default;

void Engine::loadMesh(const std::string & fileOrContent)
{
    std::tie(_mesh, _geometry) = readSurfaceMesh(fileOrContent);
}

} // namespace v3d