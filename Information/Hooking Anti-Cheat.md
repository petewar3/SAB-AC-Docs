## Hooking Anti-Cheat

**Recap:**
- The anti-cheat will be debugged to see how functions are called and their return results
- Depending on the results we can infer what they do and what they are for

Now that the decision of how the anti-cheat will be bypassed has been made I now need to figure out how I can hook the anti-cheat function

I done some little debugging with macsploits autoexec because it runs instantly and I can get all the descendants in ReplicatedFirst before the anti-cheat runs and hides itself so I can get the anti-cheats real path before its hidden.
With that I managed to get the real path and I made a [HashFunctionDumper](https://github.com/petewar3/SAB-AC-Docs/blob/main/Scripts/Debugging/HashFunctionDumper.lua) to get all function hashes from a script source and save to a file which I can later use to identify functions in the anti-cheat due to the fact thats its obfuscated and they have anonymous names.

Once I got all the function hashes in [HASH_FUNCTION_DUMPED](https://github.com/petewar3/SAB-AC-Docs/blob/main/Scripts/Debugging/HASH_FUNCTION_DUMPED.lua) I began going through them individualy and hooking the functions from hash and checking how they were called and their return values by using this [HashFunctionLogger](https://github.com/petewar3/SAB-AC-Docs/blob/main/Scripts/Debugging/HashFunctionLogger.lua) that I made to see if I can find anything functions that give me interesting results due to the fact that there is a lot of junk code and junk functions in obfuscation.

Eventually I managed to find a function with a hash of ```lua"293cf47e10f01f0fc030c1a79829e28cf7cda2629ffcb6d3295710dca2b71f0ba39acecee058d182cf14fe89bd765921"``` that was giving back interesting results on how the function was called and the return results which ended up being for executor asset detection so I could confirm that this was the function that was being used for anti-cheat

<img width="1440" height="900" alt="ExecutorAssetDetetion" src="https://github.com/user-attachments/assets/4df80f1b-c2c4-40b2-b0f8-aa8473ed87c7" />

I can confirm that this is the function used for anti-cheat since it is seen 18 times in the getgc function hash dump and the fact that the function is also being called and returned with completely different arguments to asset detection such as HttpService:GenerateGUID() and os.time

<img width="1440" height="900" alt="Screenshot 2025-12-30 at 17 39 17" src="https://github.com/user-attachments/assets/9e52fe5c-bd79-4f0f-a79c-337887e569b6" />

Back: [Anti-Cheat Bypass Decision Tree](https://github.com/petewar3/SAB-AC-Docs/blob/main/Information/Anti-Cheat%20Bypass%20Decision%20Tree.md)

Next: [Bypassing Anti-Cheat]()
