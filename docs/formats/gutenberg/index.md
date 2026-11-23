# The Gutenberg

"The Gutenberg", "Gutenberg Jr", and "Gutenberg Sr" is a wordprocessing system by Gutenberg Software Limited. It is a graphical word processor environment. Not too much is known about the format, but it was documented by David Schmidt (who also wrote the initial capability for AppleCommander).

## "The Gutenberg" & DIVERSI-DOS

If you review track 0, sector 10 on the Gutenberg boot disk (side 1), you'll notice the DIVERSI-DOS copyright. Somewhat interestingly, there is a DOS VTOC on track 3, sector 0 and a single catalog sector on track 3, sector 1. They look valid, except the catalog sector points back to the VTOC (instead of pointing at T0,S0 to end the catalog). Presumably, the original Gutenberg word processor used DOS to get things off the ground. The other disks have nothing (beyond the boot sector) in tracks 0-2.

## Bitmap

Track 17, sector 6 appears to be a disk bitmap. It starts with track 3, sector 0 at offset `$00` and uses a nibble per track. The first byte is both track 3, sectors 0 and 1. The coding is not fully understood -- `$80` for sector 0 and `$01` for sector 1; using both sectors has `$81`. However, sometimes these end up being `$FF`, and reason is unknown.

It's also interesting to note that a newly formatted data disk has bytes at offset `+$70` of `$FF $81 $81 $81` which blocks out the first 8 sectors of track 17. The first catalog sector is track 17, sector 7 and the bitmap is on track 17, sector 6. Presumably sector 0 is left blank to not confuse a DOS disk. What the usage is of sectors 1-5 is unknown.

## References

* [Gutenberg notes](https://ciderpress2.com/formatdoc/Gutenberg-notes.html)
