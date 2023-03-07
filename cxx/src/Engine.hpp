#pragma once

#include "geometrycentral/surface/meshio.h"
#include "geometrycentral/surface/surface_mesh.h"

#include <memory>

namespace v3d {
class Engine
{
public:
    Engine();

    void loadMesh(const std::string & fileOrContent);

private:
    std::unique_ptr<geometrycentral::surface::SurfaceMesh> _mesh;
    std::unique_ptr<geometrycentral::surface::VertexPositionGeometry> _geometry;
};
} // namespace v3d