class Solution {
public:
    bool isPalindrome(string s) {
        int start = 0;
        int end = s.size() - 1;

        while (start <= end) {
            if (!isalnum(s[start])) { // Skip non-alphanumeric character from
                                      // the left side
                start++;
                continue;
            }
            if (!isalnum(s[end])) { // Skip non-alphanumeric character from the
                                    // right side
                end--;
                continue;
            }
            if (tolower(s[start]) !=
                tolower(s[end])) { // Compare characters ignoring
                                   // uppercase/lowercase difference
                return false;
            } else { // Characters match, move both pointers inward
                start++;
                end--;
            }
        }
        return 1; // All valid characters matched
    }
};


/*This code is from the Valid Palindrome problem. The goal is to compare only letters and digits and ignore spaces, commas, colons, etc.

1. if (!isalnum(s[start]))
if(!isalnum(s[start]))
Meaning
isalnum(s[start]) checks whether the character at start is a letter (a-z, A-Z) or digit (0-9).
! means NOT.

So this condition becomes true when the character is not a letter or digit.

Why used?

We don't want special characters to participate in palindrome checking.

Example:

s = "A man, a plan"
      ^

If start points to ' ' (space) or ',', we simply skip it.

start++;
continue;

Move to the next character and continue the loop.

2. if (!isalnum(s[end]))
if(!isalnum(s[end]))
Meaning

Checks whether the character at end is not a letter or digit.

Why used?

Just like the left side, special characters on the right side should also be ignored.

Example:

s = "race car!"
           ^

'!' is not alphanumeric, so:

end--;
continue;

Move left and ignore it.

3. if (tolower(s[start]) != tolower(s[end]))
if(tolower(s[start]) != tolower(s[end]))
Meaning

Convert both characters to lowercase and compare them.

Why used?

A palindrome check should ignore case differences.

Example:

'A' and 'a'

Without tolower():

'A' != 'a'

which is true because their ASCII values differ.

With tolower():

tolower('A') = 'a'
tolower('a') = 'a'

Now they match.

Overall Flow
1. Check left character.
   If special character → skip it.

2. Check right character.
   If special character → skip it.

3. Compare valid characters ignoring case.
   If different → not a palindrome.

4. If same → move both pointers inward.

5. Repeat until pointers meet.

Example:

"A man, a plan, a canal: Panama"

Comparison sequence:

A ↔ a  ✓
m ↔ m  ✓
a ↔ a  ✓
n ↔ n  ✓
...

Spaces, commas, and colons are skipped because of the first two conditions. Hence the string is considered a palindrome.*/