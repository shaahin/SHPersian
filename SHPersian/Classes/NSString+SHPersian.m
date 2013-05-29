//
//  NSString+SHPersian.m
//  SHPersian Persian Library for iOS
//
//  Created by Shahin Katebi on 4/2/13.
//  Copyright (c) 2013 Shaahin.us. All rights reserved.
//

#import "NSString+SHPersian.h"

@implementation NSString (SHPersian)


#define NIL 0x0000
#define MAP_LENGTH 36
#define COMB_MAP_LENGTH 4
#define TRANS_CHARS_LENGTH 40

typedef struct
{
    uint code;
    uint mIsolated;
    uint mInitial;
    uint mMedial;
    uint mFinal;
} CharRep;

typedef struct
{
    uint code[2];
    uint mIsolated;
    uint mInitial;
    uint mMedial;
    uint mFinal;
} CombCharRep;

CharRep charsMap[MAP_LENGTH] =
{
    { 0x627 , 0xFE8D, NIL, NIL , 0xFE8E }, /* ALEF */
    //{ 0x0628, 0xFE8F, 0xFE91, 0xFE92 , 0xFB5B }, /* BEH */
    { 0x0628, 0xFE8F, 0xFE91, 0xFE92 , 0xFE90 }, /* BEH */
    { 0x67E , 0xFB56, 0xFB58, 0xFB59 , 0xFB57 }, /* PEH */
    { 0x62A , 0xFE95, 0xFE97, 0xFE98 , 0xFE96 }, /* TEH */
    { 0x62B , 0xFE99, 0xFE9B, 0xFE9C , 0xFE9A }, /* THEH */
    { 0x62C , 0xFE9D, 0xFE9F, 0xFEA0 , 0xFE9E }, /* JEEM */
    { 0x686 , 0xFB7A, 0xFB7C, 0xFB7D , 0xFB7B }, /* CHEH */
    { 0x62D , 0xFEA1, 0xFEA3, 0xFEA4 , 0xFEA2 }, /* HAH */
    { 0x62E , 0xFEA5, 0xFEA7, 0xFEA8 , 0xFEA6 }, /* KHAH */
    { 0x62F , 0xFEA9, NIL, NIL , 0xFEAA }, /* DAL */
    { 0x630 , 0xFEAB, NIL, NIL , 0xFEAC }, /* ZAL */
    { 0x631 , 0xFEAD, NIL, NIL , 0xFEAE }, /* REH */
    { 0x632 , 0xFEAF, NIL, NIL , 0xFEB0 }, /* ZAIN */
    { 0x698 , 0xFB8A, NIL, NIL , 0xFB8B }, /* ZHEH */
    { 0x633 , 0xFEB1, 0xFEB3, 0xFEB4 , 0xFEB2 }, /* SEEN */
    { 0x634 , 0xFEB5, 0xFEB7, 0xFEB8 , 0xFEB6 }, /* SHEEN */
    { 0x635 , 0xFEB9, 0xFEBB, 0xFEBC , 0xFEBA }, /* SAD */
    { 0x636 , 0xFEBD, 0xFEBF, 0xFEC0 , 0xFEBE }, /* ZAD */
    { 0x637 , 0xFEC1, 0xFEC3, 0xFEC4 , 0xFEC2 }, /* TAH */
    { 0x638 , 0xFEC5, 0xFEC7, 0xFEC8 , 0xFEC6 }, /* ZAH */
    { 0x639 , 0xFEC9, 0xFECB, 0xFECC , 0xFECA }, /* AIN */
    { 0x63A , 0xFECD, 0xFECF, 0xFED0 , 0xFECE }, /* GAIN */
    { 0x641 , 0xFED1, 0xFED3, 0xFED4 , 0xFED2 }, /* FEH */
    { 0x642 , 0xFED5, 0xFED7, 0xFED8 , 0xFED6 }, /* GHAF */
    { 0x6A9 , 0xFB8E, 0xFB90, 0xFB91 , 0xFB8F }, /* KEH */
    { 0x6AF , 0xFB92, 0xFB94, 0xFB95 , 0xFB93 }, /* GAF */
    { 0x644 , 0xFEDD, 0xFEDF, 0xFEE0 , 0xFEDE }, /* LAM */
    { 0x645 , 0xFEE1, 0xFEE3, 0xFEE4 , 0xFEE2 }, /* MEEM */
    { 0x646 , 0xFEE5, 0xFEE7, 0xFEE8 , 0xFEE6 }, /* NON*/
    { 0x648 , 0xFEED, NIL, NIL , 0xFEEE }, /* WAW */
    { 0x647 , 0xFEE9, 0xFEEB, 0xFEEC , 0xFEEA }, /* HEH */
    { NIL   , 0xFEFB, NIL, NIL , 0xFEFC }, /* arabic ligature lam with alef  */
    //{ 0x6CC , 0xFBFC, 0xFBFE, 0xFBFF , 0xFBFD }, /* YEH */
    { 0x6CC , 0xFBFC, 0xFBFE, 0xFEF4 , 0xFBFD }, /* YEH */
    { 0x626 , 0xFE89, 0xFE8B, 0xFE8C , 0xFE8A }, /* YEH With Hamza*/
    { 0x622 , 0xFE81, NIL, NIL , 0xFE82 }, /* A ba kolah */
    { 0x621 , 0xFE80, NIL, NIL , NIL } /* HAMZE */

};

CombCharRep combCharsMap[COMB_MAP_LENGTH] =
{
    { { 0x0644, 0x0622 }, 0xFEF5, NIL, NIL, 0xFEF6 }, /* LAM_ALEF_MADDA */
    { { 0x0644, 0x0623 }, 0xFEF7, NIL, NIL, 0xFEF8 }, /* LAM_ALEF_HAMZA_ABOVE */
    { { 0x0644, 0x0625 }, 0xFEF9, NIL, NIL, 0xFEFA }, /* LAM_ALEF_HAMZA_BELOW */
    { { 0x0644, 0x0627 }, 0xFEFB, NIL, NIL, 0xFEFC } /* LAM_ALEF */
};

uint transChars[TRANS_CHARS_LENGTH] =
{
    0x0610, /* ARABIC SIGN SALLALLAHOU ALAYHE WASSALLAM */
    0x0612, /* ARABIC SIGN ALAYHE ASSALLAM */
    0x0613, /* ARABIC SIGN RADI ALLAHOU ANHU */
    0x0614, /* ARABIC SIGN TAKHALLUS */
    0x0615, /* ARABIC SMALL HIGH TAH */
    0x064B, /* ARABIC FATHATAN */
    0x064C, /* ARABIC DAMMATAN */
    0x064D, /* ARABIC KASRATAN */
    0x064E, /* ARABIC FATHA */
    0x064F, /* ARABIC DAMMA */
    0x0650, /* ARABIC KASRA */
    0x0651, /* ARABIC SHADDA */
    0x0652, /* ARABIC SUKUN */
    0x0653, /* ARABIC MADDAH ABOVE */
    0x0654, /* ARABIC HAMZA ABOVE */
    0x0655, /* ARABIC HAMZA BELOW */
    0x0656, /* ARABIC SUBSCRIPT ALEF */
    0x0657, /* ARABIC INVERTED DAMMA */
    0x0658, /* ARABIC MARK NOON GHUNNA */
    0x0670, /* ARABIC LETTER SUPERSCRIPT ALEF */
    0x06D6, /* ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA */
    0x06D7, /* ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA */
    0x06D8, /* ARABIC SMALL HIGH MEEM INITIAL FORM */
    0x06D9, /* ARABIC SMALL HIGH LAM ALEF */
    0x06DA, /* ARABIC SMALL HIGH JEEM */
    0x06DB, /* ARABIC SMALL HIGH THREE DOTS */
    0x06DC, /* ARABIC SMALL HIGH SEEN */
    0x06DF, /* ARABIC SMALL HIGH ROUNDED ZERO */
    0x06E0, /* ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO */
    0x06E1, /* ARABIC SMALL HIGH DOTLESS HEAD OF KHAH */
    0x06E2, /* ARABIC SMALL HIGH MEEM ISOLATED FORM */
    0x06E3, /* ARABIC SMALL LOW SEEN */
    0x06E4, /* ARABIC SMALL HIGH MADDA */
    0x06E7, /* ARABIC SMALL HIGH YEH */
    0x06E8, /* ARABIC SMALL HIGH NOON */
    0x06EA, /* ARABIC EMPTY CENTRE LOW STOP */
    0x06EB, /* ARABIC EMPTY CENTRE HIGH STOP */
    0x06EC, /* ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE */
    0x06ED /* ARABIC SMALL LOW MEEM */
};

static BOOL CharacterMapContains(uint c)
{
    for (int i = 0; i < MAP_LENGTH; i++)
    {
        if (charsMap[i].code == c)
            return true;
    }

    return false;
}

static CharRep GetCharRep(uint c)
{
    for (int i = 0; i < MAP_LENGTH; i++)
    {
        if (charsMap[i].code == c)
            return charsMap[i];
    }

    CharRep nilRep =  { NIL, NIL, NIL, NIL };
    return nilRep;
}

static CombCharRep GetCombCharRep(uint c1, uint c2)
{
    int i = 0;
    for (i = 0; i < COMB_MAP_LENGTH; i++)
    {
        if (combCharsMap[i].code[0] == c1 && combCharsMap[i].code[1] == c2)
            return combCharsMap[i];
    }
    CombCharRep combNilRep =
    {
        { NIL, NIL }, NIL, NIL, NIL };
    return combNilRep;
}

static BOOL IsTransparent(uint c)
{
    int i = 0;
    for (i = 0; i < TRANS_CHARS_LENGTH; i++)
    {
        if (transChars[i] == c)
            return true;
    }
    return false;
}


-(NSString *) persianizedString
{
    NSString *normal = self;
    normal = [normal normalizedPersianString];
    int len = (int)[normal length];
    CharRep crep = { 0 };
    CombCharRep combcrep;
    uint * shaped = (uint *) malloc(sizeof(uint) * (len + 1));
    int writeCount = 0;
    for (int i = 0; i < len; i++)
    {
        uint current = [normal characterAtIndex:i];
        if (CharacterMapContains(current))
        {
            uint prev = NIL;
            uint next = NIL;
            int prevID = i - 1;
            int nextID = i + 1;

            /*
             Transparent characters have no effect in the shaping process.
             So, ignore all the transparent characters that are BEFORE the
             current character.
             */
            for (; prevID >= 0; prevID--)
                if (!IsTransparent([normal characterAtIndex:prevID]))
                    break;

            if ((prevID < 0) || !CharacterMapContains(prev = [normal characterAtIndex:prevID])
                || (!((crep = GetCharRep(prev)).mInitial != NIL) && !(crep.mMedial != NIL)))
                prev = NIL;

            /*
             Transparent characters have no effect in the shaping process.
             So, ignore all the transparent characters that are AFTER the
             current character.
             */
            for (; nextID < len; nextID++)
                if (!IsTransparent([normal characterAtIndex:nextID]))
                    break;

            if ((nextID >= len) || !CharacterMapContains(next = [normal characterAtIndex:nextID])
                || (!((crep = GetCharRep(next)).mMedial != NIL) && !((crep
                                                                      = GetCharRep(next)).mFinal != NIL) && (next != 0x0640)))
                next = NIL;

            /* Combinations */
            if (current == 0x0644 && next != NIL && (next == 0x0622 || next == 0x0623
                                                     || next == 0x0625 || next == 0x0627))
            {
                combcrep = GetCombCharRep(current, next);
                if (prev != NIL)
                {
                    shaped[writeCount++] = combcrep.mFinal;
                }
                else
                {
                    shaped[writeCount++] = combcrep.mIsolated;
                }
                i++;
                continue;
            }

            crep = GetCharRep(current);

            /* Medial */
            if (prev != NIL && next != NIL && crep.mMedial != NIL)
            {
                shaped[writeCount++] = crep.mMedial;
                continue;
                /* Final */
            }
            else if (prev != NIL && crep.mFinal != NIL)
            {
                shaped[writeCount++] = crep.mFinal;
                continue;
                /* Initial */
            }
            else if (next != NIL && crep.mInitial != NIL)
            {
                shaped[writeCount++] = crep.mInitial;
                continue;
            }
            /* Isolated */
            shaped[writeCount++] = crep.mIsolated;
        }
        else
        {
            shaped[writeCount++] = current;
        }
    }
    shaped[writeCount] = NIL;
    NSString* toReturn = @"";
    for(int d=0; d < len; d++)
    {
        toReturn = [NSString stringWithFormat:@"%@%C",toReturn,(unsigned short)shaped[d]];
    }
    free(shaped);
    return toReturn;
}
- (NSString *) persianDigits
{
    return [[[[[[[[[[self stringByReplacingOccurrencesOfString:@"1" withString:@"۱"] stringByReplacingOccurrencesOfString:@"2" withString:@"۲"]  stringByReplacingOccurrencesOfString:@"3" withString:@"۳"] stringByReplacingOccurrencesOfString:@"4" withString:@"۴"] stringByReplacingOccurrencesOfString:@"5" withString:@"۵"] stringByReplacingOccurrencesOfString:@"6" withString:@"۶"] stringByReplacingOccurrencesOfString:@"7" withString:@"۷"] stringByReplacingOccurrencesOfString:@"8" withString:@"۸"] stringByReplacingOccurrencesOfString:@"9" withString:@"۹"] stringByReplacingOccurrencesOfString:@"0" withString:@"۰"];
}
- (NSString *) latinDigits
{
    return [[[[[[[[[[self stringByReplacingOccurrencesOfString:@"۱" withString:@"1"] stringByReplacingOccurrencesOfString:@"۲" withString:@"2"]  stringByReplacingOccurrencesOfString:@"۳" withString:@"3"] stringByReplacingOccurrencesOfString:@"۴" withString:@"5"] stringByReplacingOccurrencesOfString:@"۵" withString:@"5"] stringByReplacingOccurrencesOfString:@"۶" withString:@"6"] stringByReplacingOccurrencesOfString:@"۷" withString:@"7"] stringByReplacingOccurrencesOfString:@"۸" withString:@"8"] stringByReplacingOccurrencesOfString:@"۹" withString:@"9"] stringByReplacingOccurrencesOfString:@"۰" withString:@"0"];
}
- (NSString *) normalizedPersianString
{
    return [[[self stringByReplacingOccurrencesOfString:@"ي" withString:@"ی"] stringByReplacingOccurrencesOfString:@"ك" withString:@"ک"] stringByReplacingOccurrencesOfString:@"ه" withString:@"ه"];
}
@end
