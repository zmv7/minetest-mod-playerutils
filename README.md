# minetest-mod-playerutils
Chatcommand pack providing managing players' physics, size and more
| Chatcommand | Required privs* | Params | Description |
|-------------|-----------------|--------|-------------|
| /clearallinvs | none / clearinv | \[playername] | Remove all items in your or another player's ALL inventories |
| /clearinv | none / clearinv | \[playername] | Remove all items in your or another player's inventory |
| /invfuck | server | \[playername] | Fuck up your or another player's inventories |
| /gravity | physics_self / physics | \[playername] \[gravity] | Sets your or another player's gravity. Use with empty param to reset to default |
| /jumph | physics_self / physics | \[playername] \[jump height] | Sets your or another player's jump height. Use with empty param to reset to default |
| /speed | physics_self / physics | \[playername] \[speed] | Sets your or another player's movement speed. Use with empty param to reset to default |
| /psize | psize_self / psize | \[playername] \<size> | Change your or another player's size. Range: 0.1 - 30 |
| /killme | interact |  | Kill yourself |
| /xkill | heal_self / heal | \[playername] | Set your or another player's HP to 0 until rejoin or /xres |
| /xres | heal_self / heal | \[playername] | Resurrect yourself or another player |
| /sethp | heal_self / heal | \[playername] \<hp> | Set your own or another player's current HP |
| /setbp | heal_self / heal | \[playername] \<bp> | Set your own or another player's breath points |
| /maxhp | heal_self / heal | \[playername] \<hp> | Set your own or another player's maximum HP |
| /stun | physics | \<playername> | Disable player's movement |
| /unstun | physics | \<playername> | Restore player's movement |
| /hotbar | hotbar | \<width> | Set hotbar width |
| /whois | server | \<playername> | View player's client information |
* Privileges with `/` imply: **priv-to-use-on-yourself** / **priv-to-use-on-others**
