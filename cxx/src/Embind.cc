#include "Engine.hpp"

using namespace v3d;
#ifdef __EMSCRIPTEN__
#include <emscripten/bind.h>
#include <sstream>

// #ifdef __EMSCRIPTEN_PTHREADS__
// #include <future>
// void solveAsync(std::string problem, int precision, emscripten::val cb)
// {
//     std::async([&]() {
//         const auto result = solve(problem, precision);
//         cb(emscripten::val(result));
//     });
// }
// #endif

EMSCRIPTEN_BINDINGS(solver)
{
    using namespace emscripten;

    class_<Engine>("BaseEngine").constructor<>().function("loadMesh", &Engine::loadMesh);
}
#endif
