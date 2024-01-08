-- Adds cube utilization to the tracked victory statistics in global
if not global.victory_statistics then return end
global.victory_statistics.utilization = { idle = 0, working = 0 }