/*
 * YARA rules for x86 ELF packer detection.
 * Copyright (c) 2017 Avast Software, licensed under the MIT license
 */

import "elf"

rule elfcrypt_10
{
	meta:
		tool = "P"
		name = "ELFCrypt"
		version = "1.0"
		source = "from Detect It Easy signatures"
		pattern = "EB0206C6609CBE"
	strings:
		$1 = { EB 02 06 C6 60 9C BE }
	condition:
		$1 at elf.entry_point
}

rule upx_3xx_01
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.xx"
		source = "from Detect It Easy signatures"
		pattern = "E8????????EB0E5A585997608A542420E9????????60"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 ?? ?? ?? ?? 60 }
	condition:
		$1 at elf.entry_point
}

rule upx_3xx_02
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.xx"
		pattern = "E8????????608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB"
	strings:
		$1 = { E8 ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB }
	condition:
		$1 at elf.entry_point
}

rule upx_3xx_03
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.xx"
		pattern = "E8????????EB0E5A585997608A542420E9????????608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_lzma
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [LZMA]"
		source = "Made by Retdec Team"
		pattern = "E8????????EB0E5A585997608A542420E9??0B0000608B7424248B7C242C83CDFF89E58B5528AC4A88C12407C0E903BB00FDFFFFD3E38DA45C90F1FFFF83E4E06A006A0089E35383C3048B4D30FF31575383C304884302AC4A88C1240F8803C0E904884B0152"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 ?? 0B 00 00 60 8B 74 24 24 8B 7C 24 2C 83 CD FF 89 E5 8B 55 28 AC 4A 88 C1 24 07 C0 E9 03 BB 00 FD FF FF D3 E3 8D A4 5C 90 F1 FF FF 83 E4 E0 6A 00 6A 00 89 E3 53 83 C3 04 8B 4D 30 FF 31 57 53 83 C3 04 88 43 02 AC 4A 88 C1 24 0F 88 03 C0 E9 04 88 4B 01 52 }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2b_01
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2B]"
		source = "Made by Retdec Team"
		pattern = "E8????????EB0E5A585997608A542420E9EE000000608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB73EF75098B1E83EEFC11DB73E431C9"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 EE 00 00 00 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 EF 75 09 8B 1E 83 EE FC 11 DB 73 E4 31 C9 }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2b_02
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2B]"
		source = "Made by Retdec Team"
		pattern = "E8????????608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB73EF7509"
	strings:
		$1 = { E8 ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 EF 75 09 }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2d_01
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2D]"
		source = "Made by Retdec Team"
		pattern = "E8????????EB0E5A585997608A542420E902010000608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB730B75198B1E83EEFC11DB72104801DB"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 02 01 00 00 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 0B 75 19 8B 1E 83 EE FC 11 DB 72 10 48 01 DB }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2d_02
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2D]"
		source = "Made by Retdec Team"
		pattern = "E8????????608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB730B7519"
	strings:
		$1 = { E8 ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 0B 75 19 }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2e_01
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2E]"
		source = "Made by Retdec Team"
		pattern = "E8????????EB0E5A585997608A542420E912010000608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB730B75288B1E83EEFC11DB721F4801DB"
	strings:
		$1 = { E8 ?? ?? ?? ?? EB 0E 5A 58 59 97 60 8A 54 24 20 E9 12 01 00 00 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 0B 75 28 8B 1E 83 EE FC 11 DB 72 1F 48 01 DB }
	condition:
		$1 at elf.entry_point
}

rule upx_39x_nrv2e_02
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.9x [NRV2E]"
		source = "Made by Retdec Team"
		pattern = "E8????????608B7424248B7C242C83CDFFEB0F90909090908A064688074701DB75078B1E83EEFC11DB8A0772EBB80100000001DB75078B1E83EEFC11DB11C001DB730B7528"
	strings:
		$1 = { E8 ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 CD FF EB 0F 90 90 90 90 90 8A 06 46 88 07 47 01 DB 75 07 8B 1E 83 EE FC 11 DB 8A 07 72 EB B8 01 00 00 00 01 DB 75 07 8B 1E 83 EE FC 11 DB 11 C0 01 DB 73 0B 75 28 }
	condition:
		$1 at elf.entry_point
}

rule x86_lzma_v393
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.93 [LZMA]"
		source = "Made by Jan Neduchal"
		pattern = "E8????????EB??????????????????????????????608B7424248B7C242C83????89E58B5528AC4A88C12407C0E903BB??"
	strings:
		$h00 = { E8 ?? ?? ?? ?? EB ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 ?? ?? 89 E5 8B 55 28 AC 4A 88 C1 24 07 C0 E9 03 BB ?? }
	condition:
		$h00 at elf.entry_point
}


rule x86_nrv2x_v393
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.93 [NRV2x]"
		source = "Made by Jan Neduchal"
		pattern = "E8????????EB??????????????????????????????608B7424248B7C242C83????EB????????????8A064688074701DB75"
	strings:
		$h00 = { E8 ?? ?? ?? ?? EB ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 ?? ?? EB ?? ?? ?? ?? ?? ?? 8A 06 46 88 07 47 01 DB 75 }
	condition:
		$h00 at elf.entry_point
}


rule x86_lzma_v395
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.95 [NRV2x]"
		source = "Made by Jan Neduchal"
		pattern = "50E8????????EB??????????????????????????????608B7424248B7C242C83????89E58B5528AC4A88C12407C0E903BB"
	strings:
		$h00 = { 50 E8 ?? ?? ?? ?? EB ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 ?? ?? 89 E5 8B 55 28 AC 4A 88 C1 24 07 C0 E9 03 BB }
	condition:
		$h00 at elf.entry_point
}


rule x86_nrv2x_v395
{
	meta:
		tool = "P"
		name = "UPX"
		version = "3.95 [NRV2x]"
		source = "Made by Jan Neduchal"
		pattern = "50E8????????EB??????????????????????????????608B7424248B7C242C83????EB??????????8A064688074701DB75"
	strings:
		$h00 = { 50 E8 ?? ?? ?? ?? EB ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 60 8B 74 24 24 8B 7C 24 2C 83 ?? ?? EB ?? ?? ?? ?? ?? 8A 06 46 88 07 47 01 DB 75 }
	condition:
		$h00 at elf.entry_point
}

