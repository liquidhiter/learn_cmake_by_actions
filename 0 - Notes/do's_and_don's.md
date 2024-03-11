```markdown
- Do not use global functions: This includes link_directories, include_libraries, and similar.
- Don't add unneeded PUBLIC requirements: You should avoid forcing something on users that is not required    (-Wall). Make these PRIVATE instead.
- Don't GLOB files: Make or another tool will not know if you add files without rerunning CMake. Note that CMake 3.12 adds a CONFIGURE_DEPENDS flag that makes this far better if you need to use it.
- Link to built files directly: Always link to targets if available.
- Never skip PUBLIC/PRIVATE when linking: This causes all future linking to be keyword-less.
```