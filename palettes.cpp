/*
 * palettes.cpp
 *
 *  Created on: Jan 11, 2019
 *      Author: pedward
 */

#include "palettes.h"

const palette::pal_t palette::vga_pal[] = {
			{0,0,0},
			{0,0,168},
			{0,168,0},
			{0,168,168},
			{168,0,0},
			{168,0,168},
			{168,87,0},
			{168,168,168},
			{87,87,87},
			{87,87,255},
			{87,255,87},
			{87,255,255},
			{255,87,87},
			{255,87,255},
			{255,255,87},
			{255,255,255},
			{0,0,0},
			{23,23,23},
			{32,32,32},
			{47,47,47},
			{56,56,56},
			{71,71,71},
			{80,80,80},
			{96,96,96},
			{112,112,112},
			{128,128,128},
			{144,144,144},
			{160,160,160},
			{183,183,183},
			{200,200,200},
			{224,224,224},
			{255,255,255},
			{0,0,255},
			{64,0,255},
			{127,0,255},
			{191,0,255},
			{255,0,255},
			{255,0,191},
			{255,0,127},
			{255,0,64},
			{255,0,0},
			{255,64,0},
			{255,127,0},
			{255,191,0},
			{255,255,0},
			{191,255,0},
			{127,255,0},
			{64,255,0},
			{0,255,0},
			{0,255,64},
			{0,255,127},
			{0,255,191},
			{0,255,255},
			{0,191,255},
			{0,127,255},
			{0,64,255},
			{127,127,255},
			{159,127,255},
			{191,127,255},
			{223,127,255},
			{255,127,255},
			{255,127,223},
			{255,127,191},
			{255,127,159},
			{255,127,127},
			{255,159,127},
			{255,191,127},
			{255,223,127},
			{255,255,127},
			{223,255,127},
			{191,255,127},
			{159,255,127},
			{127,255,127},
			{127,255,159},
			{127,255,191},
			{127,255,223},
			{127,255,255},
			{127,223,255},
			{127,191,255},
			{127,159,255},
			{183,183,255},
			{199,183,255},
			{216,183,255},
			{232,183,255},
			{255,183,255},
			{255,183,232},
			{255,183,216},
			{255,183,199},
			{255,183,183},
			{255,199,183},
			{255,216,183},
			{255,232,183},
			{255,255,183},
			{232,255,183},
			{216,255,183},
			{199,255,183},
			{183,255,183},
			{183,255,199},
			{183,255,216},
			{183,255,232},
			{183,255,255},
			{183,232,255},
			{183,216,255},
			{183,199,255},
			{0,0,112},
			{31,0,112},
			{56,0,112},
			{87,0,112},
			{112,0,112},
			{112,0,87},
			{112,0,56},
			{112,0,31},
			{112,0,0},
			{112,31,0},
			{112,56,0},
			{112,87,0},
			{112,112,0},
			{87,112,0},
			{56,112,0},
			{31,112,0},
			{0,112,0},
			{0,112,31},
			{0,112,56},
			{0,112,87},
			{0,112,112},
			{0,87,112},
			{0,56,112},
			{0,31,112},
			{56,56,112},
			{71,56,112},
			{87,56,112},
			{96,56,112},
			{112,56,112},
			{112,56,96},
			{112,56,87},
			{112,56,71},
			{112,56,56},
			{112,71,56},
			{112,87,56},
			{112,96,56},
			{112,112,56},
			{96,112,56},
			{87,112,56},
			{71,112,56},
			{56,112,56},
			{56,112,71},
			{56,112,87},
			{56,112,96},
			{56,112,112},
			{56,96,112},
			{56,87,112},
			{56,71,112},
			{80,80,112},
			{88,80,112},
			{96,80,112},
			{104,80,112},
			{112,80,112},
			{112,80,104},
			{112,80,96},
			{112,80,88},
			{112,80,80},
			{112,88,80},
			{112,96,80},
			{112,104,80},
			{112,112,80},
			{104,112,80},
			{96,112,80},
			{88,112,80},
			{80,112,80},
			{80,112,88},
			{80,112,96},
			{80,112,104},
			{80,112,112},
			{80,104,112},
			{80,96,112},
			{80,88,112},
			{0,0,64},
			{16,0,64},
			{32,0,64},
			{48,0,64},
			{64,0,64},
			{64,0,48},
			{64,0,32},
			{64,0,16},
			{64,0,0},
			{64,16,0},
			{64,32,0},
			{64,48,0},
			{64,64,0},
			{48,64,0},
			{32,64,0},
			{16,64,0},
			{0,64,0},
			{0,64,16},
			{0,64,32},
			{0,64,48},
			{0,64,64},
			{0,48,64},
			{0,32,64},
			{0,16,64},
			{32,32,64},
			{40,32,64},
			{48,32,64},
			{56,32,64},
			{64,32,64},
			{64,32,56},
			{64,32,48},
			{64,32,40},
			{64,32,32},
			{64,40,32},
			{64,48,32},
			{64,56,32},
			{64,64,32},
			{56,64,32},
			{48,64,32},
			{40,64,32},
			{32,64,32},
			{32,64,40},
			{32,64,48},
			{32,64,56},
			{32,64,64},
			{32,56,64},
			{32,48,64},
			{32,40,64},
			{47,47,64},
			{48,47,64},
			{55,47,64},
			{63,47,64},
			{64,47,64},
			{64,47,63},
			{64,47,55},
			{64,47,48},
			{64,47,47},
			{64,48,47},
			{64,55,47},
			{64,63,47},
			{64,64,47},
			{63,64,47},
			{55,64,47},
			{48,64,47},
			{47,64,47},
			{47,64,48},
			{47,64,55},
			{47,64,63},
			{47,64,64},
			{47,63,64},
			{47,55,64},
			{47,48,64},
			{0,0,0},
			{0,0,0},
			{0,0,0},
			{0,0,0},
			{0,0,0},
			{0,0,0},
			{0,0,0},
			{0,0,0}
	};

const palette::pal_t palette::cga_pal[] = {
			{0,0,0},
			{0,0,168},
			{0,168,0},
			{0,168,168},
			{168,0,0},
			{168,0,168},
			{168,87,0},
			{168,168,168},
			{87,87,87},
			{87,87,255},
			{87,255,87},
			{87,255,255},
			{255,87,87},
			{255,87,255},
			{255,255,87},
			{255,255,255}
	};

const palette::pal_t palette::rgb8bpp_pal[] = {
{0,0,0},
{37,0,0},
{73,0,0},
{110,0,0},
{146,0,0},
{183,0,0},
{219,0,0},
{255,0,0},
{0,37,0},
{37,37,0},
{73,37,0},
{110,37,0},
{146,37,0},
{183,37,0},
{219,37,0},
{255,37,0},
{0,73,0},
{37,73,0},
{73,73,0},
{110,73,0},
{146,73,0},
{183,73,0},
{219,73,0},
{255,73,0},
{0,110,0},
{37,110,0},
{73,110,0},
{110,110,0},
{146,110,0},
{183,110,0},
{219,110,0},
{255,110,0},
{0,146,0},
{37,146,0},
{73,146,0},
{110,146,0},
{146,146,0},
{183,146,0},
{219,146,0},
{255,146,0},
{0,183,0},
{37,183,0},
{73,183,0},
{110,183,0},
{146,183,0},
{183,183,0},
{219,183,0},
{255,183,0},
{0,219,0},
{37,219,0},
{73,219,0},
{110,219,0},
{146,219,0},
{183,219,0},
{219,219,0},
{255,219,0},
{0,255,0},
{37,255,0},
{73,255,0},
{110,255,0},
{146,255,0},
{183,255,0},
{219,255,0},
{255,255,0},
{0,0,85},
{37,0,85},
{73,0,85},
{110,0,85},
{146,0,85},
{183,0,85},
{219,0,85},
{255,0,85},
{0,37,85},
{37,37,85},
{73,37,85},
{110,37,85},
{146,37,85},
{183,37,85},
{219,37,85},
{255,37,85},
{0,73,85},
{37,73,85},
{73,73,85},
{110,73,85},
{146,73,85},
{183,73,85},
{219,73,85},
{255,73,85},
{0,110,85},
{37,110,85},
{73,110,85},
{110,110,85},
{146,110,85},
{183,110,85},
{219,110,85},
{255,110,85},
{0,146,85},
{37,146,85},
{73,146,85},
{110,146,85},
{146,146,85},
{183,146,85},
{219,146,85},
{255,146,85},
{0,183,85},
{37,183,85},
{73,183,85},
{110,183,85},
{146,183,85},
{183,183,85},
{219,183,85},
{255,183,85},
{0,219,85},
{37,219,85},
{73,219,85},
{110,219,85},
{146,219,85},
{183,219,85},
{219,219,85},
{255,219,85},
{0,255,85},
{37,255,85},
{73,255,85},
{110,255,85},
{146,255,85},
{183,255,85},
{219,255,85},
{255,255,85},
{0,0,170},
{37,0,170},
{73,0,170},
{110,0,170},
{146,0,170},
{183,0,170},
{219,0,170},
{255,0,170},
{0,37,170},
{37,37,170},
{73,37,170},
{110,37,170},
{146,37,170},
{183,37,170},
{219,37,170},
{255,37,170},
{0,73,170},
{37,73,170},
{73,73,170},
{110,73,170},
{146,73,170},
{183,73,170},
{219,73,170},
{255,73,170},
{0,110,170},
{37,110,170},
{73,110,170},
{110,110,170},
{146,110,170},
{183,110,170},
{219,110,170},
{255,110,170},
{0,146,170},
{37,146,170},
{73,146,170},
{110,146,170},
{146,146,170},
{183,146,170},
{219,146,170},
{255,146,170},
{0,183,170},
{37,183,170},
{73,183,170},
{110,183,170},
{146,183,170},
{183,183,170},
{219,183,170},
{255,183,170},
{0,219,170},
{37,219,170},
{73,219,170},
{110,219,170},
{146,219,170},
{183,219,170},
{219,219,170},
{255,219,170},
{0,255,170},
{37,255,170},
{73,255,170},
{110,255,170},
{146,255,170},
{183,255,170},
{219,255,170},
{255,255,170},
{0,0,255},
{37,0,255},
{73,0,255},
{110,0,255},
{146,0,255},
{183,0,255},
{219,0,255},
{255,0,255},
{0,37,255},
{37,37,255},
{73,37,255},
{110,37,255},
{146,37,255},
{183,37,255},
{219,37,255},
{255,37,255},
{0,73,255},
{37,73,255},
{73,73,255},
{110,73,255},
{146,73,255},
{183,73,255},
{219,73,255},
{255,73,255},
{0,110,255},
{37,110,255},
{73,110,255},
{110,110,255},
{146,110,255},
{183,110,255},
{219,110,255},
{255,110,255},
{0,146,255},
{37,146,255},
{73,146,255},
{110,146,255},
{146,146,255},
{183,146,255},
{219,146,255},
{255,146,255},
{0,183,255},
{37,183,255},
{73,183,255},
{110,183,255},
{146,183,255},
{183,183,255},
{219,183,255},
{255,183,255},
{0,219,255},
{37,219,255},
{73,219,255},
{110,219,255},
{146,219,255},
{183,219,255},
{219,219,255},
{255,219,255},
{0,255,255},
{37,255,255},
{73,255,255},
{110,255,255},
{146,255,255},
{183,255,255},
{219,255,255},
{255,255,255}
};

const palette::palette_def palette::palettes[] = {
			{ palette::CGA_PAL, 16, palette::cga_pal },
			{ palette::VGA_PAL, 256, palette::vga_pal },
			{ palette::RGB_PAL, 256, palette::rgb8bpp_pal }
	};



