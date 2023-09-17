# Bun Docusaurus build failure reproduction repo

With Bun 1.0.2 (and earlier), Docusaurus fails to build on some Linux distros due to an issue with the react-loadable dependency ([Bun issue #2257](https://github.com/oven-sh/bun/issues/2257))

The repo includes a simple Docusaurus app first created using `npx create-docusaurus@latest bun-docusaurus classic`

The original `package-lock.json` and `node_modules` were deleted and then I reinstalled them with `bun install`.

Repository includes a Linux Alpine-based Dockerfile (node:18-alpine with Bun installed), which replicates the issue.

Upon running `docker build .`, this is the output:

```
 => ERROR [builder 1/1] RUN bun run build                                                               31.5s
------                                                                                                        
 > [builder 1/1] RUN bun run build:                                                                           
0.536 $ docusaurus build                                                                                      
2.370 [INFO] [en] Creating an optimized production build...                                                   
4.028 ℹ Compiling Client                                                                                      
4.072 ℹ Compiling Server
31.34 ✔ Client: Compiled with some errors in 27.32s
31.35 
31.35 
31.35 Module not found: Error: Can't resolve 'react-loadable' in '/app/node_modules/@docusaurus/core/lib/client/exports'
31.35 [ERROR] Client bundle compiled with errors therefore further build is impossible.
31.44 error: script "build" exited with code 1 (SIGHUP)
------
Dockerfile:11
--------------------
   9 |     FROM install-dependencies as builder
  10 |     
  11 | >>> RUN bun run build
  12 |     
--------------------
ERROR: failed to solve: process "/bin/sh -c bun run build" did not complete successfully: exit code: 1
```