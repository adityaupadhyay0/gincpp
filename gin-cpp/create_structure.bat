@echo off
setlocal enabledelayedexpansion

echo Creating Gin-CPP Framework Directory Structure...
echo.

REM Create root directory
mkdir gin-cpp 2>nul
cd gin-cpp

REM GitHub workflows and templates
mkdir .github\workflows 2>nul
mkdir .github\ISSUE_TEMPLATE 2>nul

echo # CI/CD Pipeline Configuration > .github\workflows\ci.yml
echo # Release automation workflow > .github\workflows\release.yml
echo # Security scanning workflow > .github\workflows\security.yml
echo # Bug report template > .github\ISSUE_TEMPLATE\bug_report.md
echo # Feature request template > .github\ISSUE_TEMPLATE\feature_request.md
echo # Performance issue template > .github\ISSUE_TEMPLATE\performance_issue.md
echo # Pull request template > .github\PULL_REQUEST_TEMPLATE.md

REM CMake configuration
mkdir cmake\modules 2>nul

echo # CMake module for finding Asio library > cmake\modules\FindAsio.cmake
echo # CMake module for finding OpenSSL > cmake\modules\FindOpenSSL.cmake
echo # Gin-CPP CMake configuration > cmake\modules\GinCppConfig.cmake
echo # Compiler flags configuration > cmake\CompilerFlags.cmake
echo # Dependencies configuration > cmake\Dependencies.cmake
echo # Package configuration > cmake\PackageConfig.cmake

REM Documentation structure
mkdir docs\api\core 2>nul
mkdir docs\api\middleware 2>nul
mkdir docs\api\utilities 2>nul
mkdir docs\guides 2>nul
mkdir docs\examples 2>nul
mkdir docs\reference 2>nul

echo # Server API documentation > docs\api\core\server.md
echo # Router API documentation > docs\api\core\router.md
echo # Context API documentation > docs\api\core\context.md
echo # Middleware overview documentation > docs\api\middleware\overview.md
echo # Built-in middleware documentation > docs\api\middleware\built-in.md
echo # Custom middleware documentation > docs\api\middleware\custom.md
echo # JSON utilities documentation > docs\api\utilities\json.md
echo # Static files documentation > docs\api\utilities\static-files.md
echo # WebSocket documentation > docs\api\utilities\websockets.md
echo # Getting started guide > docs\guides\getting-started.md
echo # Routing guide > docs\guides\routing.md
echo # Middleware guide > docs\guides\middleware.md
echo # Error handling guide > docs\guides\error-handling.md
echo # Performance guide > docs\guides\performance.md
echo # Deployment guide > docs\guides\deployment.md
echo # Basic server example > docs\examples\basic-server.md
echo # REST API example > docs\examples\rest-api.md
echo # WebSocket chat example > docs\examples\websocket-chat.md
echo # File upload example > docs\examples\file-upload.md
echo # Configuration reference > docs\reference\configuration.md
echo # Security reference > docs\reference\security.md
echo # Troubleshooting guide > docs\reference\troubleshooting.md
echo # Documentation overview > docs\README.md

REM Examples directory
mkdir examples\basic-server 2>nul
mkdir examples\rest-api\src\handlers 2>nul
mkdir examples\rest-api\src\models 2>nul
mkdir examples\websocket-chat\src 2>nul
mkdir examples\websocket-chat\static 2>nul
mkdir examples\file-upload\src 2>nul
mkdir examples\middleware-demo\src 2>nul
mkdir examples\performance-benchmark\src 2>nul

echo # Basic server CMake configuration > examples\basic-server\CMakeLists.txt
echo // Basic server main implementation > examples\basic-server\main.cpp
echo # Basic server example README > examples\basic-server\README.md
echo # REST API CMake configuration > examples\rest-api\CMakeLists.txt
echo // REST API main implementation > examples\rest-api\src\main.cpp
echo // User handler implementation > examples\rest-api\src\handlers\user_handler.cpp
echo // User handler header > examples\rest-api\src\handlers\user_handler.hpp
echo // User model implementation > examples\rest-api\src\models\user.cpp
echo // User model header > examples\rest-api\src\models\user.hpp
echo # REST API example README > examples\rest-api\README.md
echo # WebSocket chat CMake configuration > examples\websocket-chat\CMakeLists.txt
echo // WebSocket chat main implementation > examples\websocket-chat\src\main.cpp
echo // Chat server implementation > examples\websocket-chat\src\chat_server.cpp
echo // Chat server header > examples\websocket-chat\src\chat_server.hpp
echo ^<!-- Chat client HTML --^> > examples\websocket-chat\static\index.html
echo /* Chat client CSS */ > examples\websocket-chat\static\style.css
echo // Chat client JavaScript > examples\websocket-chat\static\app.js
echo # WebSocket chat example README > examples\websocket-chat\README.md
echo # File upload CMake configuration > examples\file-upload\CMakeLists.txt
echo // File upload main implementation > examples\file-upload\src\main.cpp
echo // Upload handler implementation > examples\file-upload\src\upload_handler.cpp
echo # File upload example README > examples\file-upload\README.md
echo # Middleware demo CMake configuration > examples\middleware-demo\CMakeLists.txt
echo // Middleware demo main implementation > examples\middleware-demo\src\main.cpp
echo // Auth middleware implementation > examples\middleware-demo\src\auth_middleware.cpp
echo // Logging middleware implementation > examples\middleware-demo\src\logging_middleware.cpp
echo # Middleware demo README > examples\middleware-demo\README.md
echo # Performance benchmark CMake configuration > examples\performance-benchmark\CMakeLists.txt
echo // Benchmark implementation > examples\performance-benchmark\src\benchmark.cpp
echo // Load test implementation > examples\performance-benchmark\src\load_test.cpp
echo # Performance benchmark README > examples\performance-benchmark\README.md

REM Include headers structure
mkdir include\gin-cpp\core 2>nul
mkdir include\gin-cpp\http 2>nul
mkdir include\gin-cpp\routing 2>nul
mkdir include\gin-cpp\middleware 2>nul
mkdir include\gin-cpp\utilities 2>nul
mkdir include\gin-cpp\config 2>nul
mkdir include\gin-cpp\security 2>nul
mkdir include\gin-cpp\monitoring 2>nul
mkdir include\gin-cpp\detail 2>nul

echo // Main Gin-CPP header file > include\gin-cpp\gin.hpp
echo // Server core header > include\gin-cpp\core\server.hpp
echo // Connection management header > include\gin-cpp\core\connection.hpp
echo // Thread pool header > include\gin-cpp\core\thread_pool.hpp
echo // Signal handler header > include\gin-cpp\core\signal_handler.hpp
echo // Memory pool header > include\gin-cpp\core\memory_pool.hpp
echo // HTTP request header > include\gin-cpp\http\request.hpp
echo // HTTP response header > include\gin-cpp\http\response.hpp
echo // HTTP context header > include\gin-cpp\http\context.hpp
echo // HTTP status codes header > include\gin-cpp\http\status.hpp
echo // HTTP headers header > include\gin-cpp\http\headers.hpp
echo // MIME types header > include\gin-cpp\http\mime_types.hpp
echo // HTTP parser header > include\gin-cpp\http\parser.hpp
echo // Router header > include\gin-cpp\routing\router.hpp
echo // Route header > include\gin-cpp\routing\route.hpp
echo // Radix tree header > include\gin-cpp\routing\radix_tree.hpp
echo // Matcher header > include\gin-cpp\routing\matcher.hpp
echo // Parameters header > include\gin-cpp\routing\params.hpp
echo // Middleware base header > include\gin-cpp\middleware\middleware.hpp
echo // Middleware chain header > include\gin-cpp\middleware\chain.hpp
echo // CORS middleware header > include\gin-cpp\middleware\cors.hpp
echo // Logging middleware header > include\gin-cpp\middleware\logging.hpp
echo // Compression middleware header > include\gin-cpp\middleware\compression.hpp
echo // Rate limiter middleware header > include\gin-cpp\middleware\rate_limiter.hpp
echo // Auth middleware header > include\gin-cpp\middleware\auth.hpp
echo // Error handler middleware header > include\gin-cpp\middleware\error_handler.hpp
echo // JSON utilities header > include\gin-cpp\utilities\json.hpp
echo // Form parser header > include\gin-cpp\utilities\form_parser.hpp
echo // File upload utilities header >.
echo // Static files utilities header > include\gin-cpp\utilities\static_files.hpp
echo // WebSocket utilities header > include\gin-cpp\utilities\websocket.hpp
echo // SSL utilities header > include\gin-cpp\utilities\ssl.hpp
echo // String utilities header > include\gin-cpp\utilities\string_utils.hpp
echo // Configuration header > include\gin-cpp\config\configuration.hpp
echo // Environment configuration header > include\gin-cpp\config\environment.hpp
echo // Settings header > include\gin-cpp\config\settings.hpp
echo // CSRF protection header > include\gin-cpp\security\csrf.hpp
echo // Session management header > include\gin-cpp\security\session.hpp
echo // Validation header > include\gin-cpp\security\validation.hpp
echo // Security headers header > include\gin-cpp\security\headers.hpp
echo // Metrics header > include\gin-cpp\monitoring\metrics.hpp
echo // Health check header > include\gin-cpp\monitoring\health_check.hpp
echo // Tracing header > include\gin-cpp\monitoring\tracing.hpp
echo // Async operations detail header > include\gin-cpp\detail\async_ops.hpp
echo // Buffer pool detail header > include\gin-cpp\detail\buffer_pool.hpp
echo // Connection pool detail header > include\gin-cpp\detail\connection_pool.hpp
echo // Timer detail header > include\gin-cpp\detail\timer.hpp
echo // Utilities detail header > include\gin-cpp\detail\utils.hpp

REM Source files structure
mkdir src\core 2>nul
mkdir src\http 2>nul
mkdir src\routing 2>nul
mkdir src\middleware 2>nul
mkdir src\utilities 2>nul
mkdir src\config 2>nul
mkdir src\security 2>nul
mkdir src\monitoring 2>nul
mkdir src\detail 2>nul

echo // Server core implementation > src\core\server.cpp
echo // Connection management implementation > src\core\connection.cpp
echo // Thread pool implementation > src\core\thread_pool.cpp
echo // Signal handler implementation > src\core\signal_handler.cpp
echo // Memory pool implementation > src\core\memory_pool.cpp
echo // HTTP request implementation > src\http\request.cpp
echo // HTTP response implementation > src\http\response.cpp
echo // HTTP context implementation > src\http\context.cpp
echo // HTTP status codes implementation > src\http\status.cpp
echo // HTTP headers implementation > src\http\headers.cpp
echo // MIME types implementation > src\http\mime_types.cpp
echo // HTTP parser implementation > src\http\parser.cpp
echo // Router implementation > src\routing\router.cpp
echo // Route implementation > src\routing\route.cpp
echo // Radix tree implementation > src\routing\radix_tree.cpp
echo // Matcher implementation > src\routing\matcher.cpp
echo // Parameters implementation > src\routing\params.cpp
echo // Middleware base implementation > src\middleware\middleware.cpp
echo // Middleware chain implementation > src\middleware\chain.cpp
echo // CORS middleware implementation > src\middleware\cors.cpp
echo // Logging middleware implementation > src\middleware\logging.cpp
echo // Compression middleware implementation > src\middleware\compression.cpp
echo // Rate limiter middleware implementation > src\middleware\rate_limiter.cpp
echo // Auth middleware implementation > src\middleware\auth.cpp
echo // Error handler middleware implementation > src\middleware\error_handler.cpp
echo // JSON utilities implementation > src\utilities\json.cpp
echo // Form parser implementation > src\utilities\form_parser.cpp
echo // File upload utilities implementation > src\utilities\file_upload.cpp
echo // Static files utilities implementation > src\utilities\static_files.cpp
echo // WebSocket utilities implementation > src\utilities\websocket.cpp
echo // SSL utilities implementation > src\utilities\ssl.cpp
echo // String utilities implementation > src\utilities\string_utils.cpp
echo // Configuration implementation > src\config\configuration.cpp
echo // Environment configuration implementation > src\config\environment.cpp
echo // Settings implementation > src\config\settings.cpp
echo // CSRF protection implementation > src\security\csrf.cpp
echo // Session management implementation > src\security\session.cpp
echo // Validation implementation > src\security\validation.cpp
echo // Security headers implementation > src\security\headers.cpp
echo // Metrics implementation > src\monitoring\metrics.cpp
echo // Health check implementation > src\monitoring\health_check.cpp
echo // Tracing implementation > src\monitoring\tracing.cpp
echo // Async operations detail implementation > src\detail\async_ops.cpp
echo // Buffer pool detail implementation > src\detail\buffer_pool.cpp
echo // Connection pool detail implementation > src\detail\connection_pool.cpp
echo // Timer detail implementation > src\detail\timer.cpp
echo // Utilities detail implementation > src\detail\utils.cpp

REM Tests structure
mkdir tests\unit\core 2>nul
mkdir tests\unit\http 2>nul
mkdir tests\unit\routing 2>nul
mkdir tests\unit\middleware 2>nul
mkdir tests\unit\utilities 2>nul
mkdir tests\unit\security 2>nul
mkdir tests\unit\monitoring 2>nul
mkdir tests\integration 2>nul
mkdir tests\performance 2>nul
mkdir tests\fixtures\test_files 2>nul
mkdir tests\fixtures\certificates 2>nul
mkdir tests\mocks 2>nul
mkdir tests\helpers 2>nul

echo // Server unit tests > tests\unit\core\test_server.cpp
echo // Connection unit tests > tests\unit\core\test_connection.cpp
echo // Thread pool unit tests > tests\unit\core\test_thread_pool.cpp
echo // Memory pool unit tests > tests\unit\core\test_memory_pool.cpp
echo // Request unit tests > tests\unit\http\test_request.cpp
echo // Response unit tests > tests\unit\http\test_response.cpp
echo // Context unit tests > tests\unit\http\test_context.cpp
echo // Parser unit tests > tests\unit\http\test_parser.cpp
echo // Headers unit tests > tests\unit\http\test_headers.cpp
echo // Router unit tests > tests\unit\routing\test_router.cpp
echo // Radix tree unit tests > tests\unit\routing\test_radix_tree.cpp
echo // Matcher unit tests > tests\unit\routing\test_matcher.cpp
echo // Parameters unit tests > tests\unit\routing\test_params.cpp
echo // Middleware chain unit tests > tests\unit\middleware\test_chain.cpp
echo // CORS unit tests > tests\unit\middleware\test_cors.cpp
echo // Logging unit tests > tests\unit\middleware\test_logging.cpp
echo // Compression unit tests > tests\unit\middleware\test_compression.cpp
echo // Rate limiter unit tests > tests\unit\middleware\test_rate_limiter.cpp
echo // JSON utilities unit tests > tests\unit\utilities\test_json.cpp
echo // Form parser unit tests > tests\unit\utilities\test_form_parser.cpp
echo // File upload unit tests > tests\unit\utilities\test_file_upload.cpp
echo // Static files unit tests > tests\unit\utilities\test_static_files.cpp
echo // CSRF unit tests > tests\unit\security\test_csrf.cpp
echo // Session unit tests > tests\unit\security\test_session.cpp
echo // Validation unit tests > tests\unit\security\test_validation.cpp
echo // Metrics unit tests > tests\unit\monitoring\test_metrics.cpp
echo // Health check unit tests > tests\unit\monitoring\test_health_check.cpp
echo // Basic server integration tests > tests\integration\test_basic_server.cpp
echo // Routing integration tests > tests\integration\test_routing_integration.cpp
echo // Middleware integration tests > tests\integration\test_middleware_integration.cpp
echo // File serving integration tests > tests\integration\test_file_serving.cpp
echo // WebSocket integration tests > tests\integration\test_websocket_integration.cpp
echo // SSL integration tests > tests\integration\test_ssl_integration.cpp
echo // Router performance benchmark > tests\performance\benchmark_router.cpp
echo // Middleware performance benchmark > tests\performance\benchmark_middleware.cpp
echo // Parser performance benchmark > tests\performance\benchmark_parser.cpp
echo // Load test implementation > tests\performance\load_test.cpp
echo # Sample HTTP requests for testing > tests\fixtures\sample_requests.txt
echo ^<!-- Test HTML file --^> > tests\fixtures\test_files\index.html
echo /* Test CSS file */ > tests\fixtures\test_files\style.css
echo { "test": "json" } > tests\fixtures\test_files\test.json
echo # Test SSL certificate > tests\fixtures\certificates\test_cert.pem
echo # Test SSL private key > tests\fixtures\certificates\test_key.pem
echo // Mock connection for testing > tests\mocks\mock_connection.hpp
echo // Mock request for testing > tests\mocks\mock_request.hpp
echo // Mock response for testing > tests\mocks\mock_response.hpp
echo // Mock middleware for testing > tests\mocks\mock_middleware.hpp
echo // Test server helper > tests\helpers\test_server.hpp
echo // Test client helper > tests\helpers\test_client.hpp
echo // Test utilities helper > tests\helpers\test_utils.hpp
echo // Test assertions helper > tests\helpers\test_assertions.hpp
echo # Tests CMake configuration > tests\CMakeLists.txt

REM Third party
mkdir third_party\asio 2>nul
mkdir third_party\nlohmann_json 2>nul
mkdir third_party\openssl 2>nul
mkdir third_party\zlib 2>nul

echo # Asio library (networking) > third_party\asio\README.md
echo # Nlohmann JSON library > third_party\nlohmann_json\README.md
echo # OpenSSL library > third_party\openssl\README.md
echo # Zlib compression library > third_party\zlib\README.md
echo # Third party dependencies information > third_party\README.md

REM Tools
mkdir tools\benchmark\src 2>nul
mkdir tools\generators\scaffold\src 2>nul
mkdir tools\generators\scaffold\templates 2>nul
mkdir tools\profiling 2>nul
mkdir tools\packaging\vcpkg 2>nul
mkdir tools\packaging\conan 2>nul

echo # Benchmark tools CMake configuration > tools\benchmark\CMakeLists.txt
echo // Benchmark runner implementation > tools\benchmark\src\benchmark_runner.cpp
echo // Performance tests implementation > tools\benchmark\src\performance_tests.cpp
echo # Benchmark tools README > tools\benchmark\README.md
echo # Scaffold generator CMake configuration > tools\generators\scaffold\CMakeLists.txt
echo // Scaffold generator main > tools\generators\scaffold\src\main.cpp
echo // Code generator implementation > tools\generators\scaffold\src\generator.cpp
echo // Basic server template > tools\generators\scaffold\templates\basic_server.cpp.template
echo // Handler template > tools\generators\scaffold\templates\handler.cpp.template
echo // CMake template > tools\generators\scaffold\templates\CMakeLists.txt.template
echo # Code generators README > tools\generators\README.md
echo // Memory profiler tool > tools\profiling\memory_profiler.cpp
echo // CPU profiler tool > tools\profiling\cpu_profiler.cpp
echo # Profiling tools README > tools\profiling\README.md
echo # Package creation script > tools\packaging\create_package.sh
echo # Vcpkg port file > tools\packaging\vcpkg\portfile.cmake
echo # Vcpkg configuration > tools\packaging\vcpkg\vcpkg.json
echo # Conan recipe > tools\packaging\conan\conanfile.py
echo # Conan data > tools\packaging\conan\conandata.yml
echo # Packaging tools README > tools\packaging\README.md

REM Scripts
mkdir scripts 2>nul

echo # Build script > scripts\build.sh
echo # Test script > scripts\test.sh
echo # Benchmark script > scripts\benchmark.sh
echo # Format script > scripts\format.sh
echo # Lint script > scripts\lint.sh
echo # Coverage script > scripts\coverage.sh
echo # Release script > scripts\release.sh

REM Packaging
mkdir packaging\docker 2>nul
mkdir packaging\rpm 2>nul
mkdir packaging\deb 2>nul
mkdir packaging\homebrew 2>nul

echo # Docker configuration > packaging\docker\Dockerfile
echo # Alpine Docker configuration > packaging\docker\Dockerfile.alpine
echo # Docker compose configuration > packaging\docker\docker-compose.yml
echo # Docker README > packaging\docker\README.md
echo # RPM spec file > packaging\rpm\gin-cpp.spec
echo # RPM README > packaging\rpm\README.md
echo # Debian control file > packaging\deb\control
echo # Debian rules file > packaging\deb\rules
echo # Debian README > packaging\deb\README.md
echo # Homebrew formula > packaging\homebrew\gin-cpp.rb
echo # Homebrew README > packaging\homebrew\README.md

REM Benchmarks
mkdir benchmarks\results\baseline 2>nul
mkdir benchmarks\configs 2>nul

echo { "router_benchmark": "baseline_results" } > benchmarks\results\baseline\router_benchmark.json
echo { "middleware_benchmark": "baseline_results" } > benchmarks\results\baseline\middleware_benchmark.json
echo { "parser_benchmark": "baseline_results" } > benchmarks\results\baseline\parser_benchmark.json
echo # Benchmark results README > benchmarks\results\README.md
echo { "benchmark_config": "configuration" } > benchmarks\configs\benchmark_config.json
echo { "load_test_config": "configuration" } > benchmarks\configs\load_test_config.json
echo # Benchmarks README > benchmarks\README.md

REM Single include
mkdir single_include 2>nul
echo // Single header distribution > single_include\gin-cpp.hpp

REM Root files
echo # Clang format configuration > .clang-format
echo # Clang tidy configuration > .clang-tidy
echo # Git ignore configuration > .gitignore
echo # Git submodules configuration > .gitmodules
echo # CMake main configuration > CMakeLists.txt
echo # CMake presets configuration > CMakePresets.json
echo # MIT License > LICENSE
echo # Project README > README.md
echo # Changelog > CHANGELOG.md
echo # Contributing guidelines > CONTRIBUTING.md
echo # Code of conduct > CODE_OF_CONDUCT.md
echo # Security policy > SECURITY.md
echo # Conan recipe > conanfile.py
echo # Vcpkg configuration > vcpkg.json

echo.
echo ✅ Gin-CPP directory structure created successfully!
echo.
echo 📁 Total directories created with placeholder files for Git tracking
echo 🔄 Run 'git init' and 'git add .' to initialize repository
echo 📝 All files contain appropriate comments for identification
echo.
echo Next steps:
echo 1. cd gin-cpp
echo 2. git init
echo 3. git add .
echo 4. git commit -m "Initial project structure"
echo.

pause
