## Identifying Anti-Cheat

**Recap:**
- Anti-Cheats are placed in ReplicatedFirst to have earlier execution then some executors
- Anti-Cheats hide themself by destroying or parenting themself to nil
- Hidden Anti-Cheats can still be found by using getnil instances

Based on this recap we can see a **important detail** that anti-cheats can still be found using getnilinstances.
Using this information I made a [Hidden Script Decompiler](https://github.com/petewar3/SAB-AC-Docs/blob/main/Scripts/Debugging/HiddenScriptDecompiler) that will decompile and save all scripts to a folder in workspace

Back: [Modern Anti-Cheat Architecture](https://github.com/petewar3/SAB-AC-Docs/blob/main/Information/Modern%20Anti-Cheat%20Architecture.md)
