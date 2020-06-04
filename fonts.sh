cd src/fonts

for font in *.ttf; do
    glyphhanger --whitelist='U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD' --subset="$font" --formats=ttf
    rename 's/subset/latin/g' *

    glyphhanger --whitelist='U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF' --subset="$font" --formats=ttf
    rename 's/subset/latin-extended/g' *

    glyphhanger --whitelist='U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116' --subset="$font" --formats=ttf
    rename 's/subset/cyrillic/g' *
done

for font in *.ttf ; do woff2_compress "$font" ; done
for font in *.ttf ; do sfnt2woff-zopfli "$font" ; done

cd ../../