#include <algorithm>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

vector<string>& split(const string& s, char delim, vector<string>& elems) {
    stringstream ss(s);
    string item;
    while (getline(ss, item, delim)) {
        elems.push_back(item);
    }

    return elems;
}

vector<string> split(const string& s, char delim) {
    vector<string> elems;
    split(s, delim, elems);
    return elems;
}

string solution1(string input) {
    vector<string> items = split(input, ' ');
    reverse(items.begin(), items.end());
    string output = "";
    for (unsigned int i = 0; i < items.size(); ++i) {
        if (i < items.size() - 1) {
            output += (items[i] + " ");
        } else {
            output += items[i];
        }
    }

    return output;
}

int main() {
    string testString = "How now brown cow";
    cout << solution1(testString) << endl;

    return 0;
}
