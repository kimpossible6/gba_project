
//{{BLOCK(gamebg)

//======================================================================
//
//	gamebg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 326 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10432 + 2048 = 12992
//
//	Time-stamp: 2018-11-12, 15:36:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gamebgTilesLen 10432
extern const unsigned short gamebgTiles[5216];

#define gamebgMapLen 2048
extern const unsigned short gamebgMap[1024];

#define gamebgPalLen 512
extern const unsigned short gamebgPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gamebg)
