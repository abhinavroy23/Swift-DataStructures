import UIKit

/*
 
 208. Implement Trie (Prefix Tree) - Medium
 
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 
 */

class Trie {
    class TrieNode{
        var chidren : [TrieNode?] = Array(repeating: nil, count: 26)
        var isEndOfWord : Bool = false
    }
    var root : TrieNode

    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var index : Int = 0
        var pCrawl : TrieNode? = root
        
        for char in word{
            index = Int(char.asciiValue! - Character("a").asciiValue!)
            if nil == pCrawl?.chidren[index]{
                pCrawl?.chidren[index] = TrieNode()
            }
            pCrawl = pCrawl?.chidren[index]
        }
        pCrawl?.isEndOfWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var index : Int = 0
        var pCrawl : TrieNode? = root
        
        for char in word{
            index = Int(char.asciiValue! - Character("a").asciiValue!)
            if nil == pCrawl?.chidren[index]{
                return false
            }
            pCrawl = pCrawl?.chidren[index]
        }
        return (nil != pCrawl) && (pCrawl?.isEndOfWord ?? false)
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var index : Int = 0
        var pCrawl : TrieNode? = root
        
        for char in prefix{
            index = Int(char.asciiValue! - Character("a").asciiValue!)
            if nil == pCrawl?.chidren[index]{
                return false
            }
            pCrawl = pCrawl?.chidren[index]
        }
        return true
    }
}

var trieDS : Trie = Trie()

for word in ["the", "a", "there", "answer", "any", "by", "bye", "their"]{
    trieDS.insert(word)
}
print(trieDS.search("the"))
print(trieDS.search("these"))
print(trieDS.search("their"))
print(trieDS.search("thew"))
print(trieDS.startsWith("a"))


