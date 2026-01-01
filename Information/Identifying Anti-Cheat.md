## Identifying Anti-Cheat

**Recap:**
- Anti-Cheats are placed in ReplicatedFirst to have earlier execution then some executors
- Anti-Cheats hide themself by destroying or parenting themself to nil
- Hidden Anti-Cheats can still be found by using getnilinstances

Based on this recap we can see a **important detail** that anti-cheats can still be found using getnilinstances.

Using this information I made a [Hidden Script Decompiler](https://github.com/petewar3/SAB-AC-Docs/blob/main/Scripts/Debugging/HiddenScriptDecompiler) that will decompile and save all in-game scripts to a folder in workspace so I can examine them later on.

I went to examine all the scripts and I could see that all of them were LocalScripts and their script name and script source.

I first examined QuantumClonerScript which I could see the source which didnt link to any anti-cheat. Then I checked ToolActivationController which I couldnt confirm at the time whether it was anti-cheat or not due to the fact that it was obfuscated. Then I checked LocalScript which I also couldnt confirm at the time whether it was anti-cheat or not since it was obfuscated. However due to my debugging on script injection on executors I could see that executors such as delta make a new LocalScript instance which is also named LocalScript which is also found in getnilinstances. Now from this I could infer that LocalScript from the hidden game files was the anti-cheat due to the fact that it seems to be disguising itself as script injection.

Now with that I was ready to start making decisions on the next step for bypassing the anti-cheat

Back: [Modern Anti-Cheat Architecture](https://github.com/petewar3/SAB-AC-Docs/blob/main/Information/Modern%20Anti-Cheat%20Architecture.md)

Next: [Anti-Cheat Bypass Decision Tree](https://github.com/petewar3/SAB-AC-Docs/blob/main/Information/Anti-Cheat%20Bypass%20Decision%20Tree.md)
