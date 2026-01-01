## Modern Anti-Cheat Architecture

To understand how steal a brainrots anti-cheat operates you need to know the modern anti-cheat architecture.

Anti-cheats prioritize placing their anti-cheat in ReplicatedFirst over StarterPlayerScripts because ReplicatedFirst runs earliest in the client lifecycle,
which can execute before some executors such as mobile executors even if the scripts are placed in autoexecs. This timing advantage ensures detection of executors,
because of the fact that they are detected before the executor is even able to do anything.

After this process, most modern anti-cheat systems will hide themself by destroying themself or parenting them to nil so their anti-cheat is harder to find and tools
such as dex explorer are unable to locate them. Although these anti-cheats have destroyed themself or parented themself to nil they can still run as normal because of
the nature of threads and the fact that the thread has already started.

Although the script is not accessable through game instance it can still be accessed when using functions like getnilinstances to return all nil instances in the game.
Even if the script has destroyed itself it will still show in the nil instances table due to the fact that there is still a reference to it which means we can get all the
hidden scripts in steal a brainrot that may potentially be anti-cheat.

This is all that you will need to know for now on how modern anti-cheats operates

Next: [Identifying Anti-Cheat](https://github.com/petewar3/SAB-AC-Docs/blob/main/Information/Identifying%20Anti-Cheat)
