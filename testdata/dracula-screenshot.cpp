/*
 * Once upon a time...
 */

#include <string>
#include <vector>

struct Props {
    std::string location;
    int birthDate;
    int deathDate;
    std::vector<std::string> weaknesses;
};

class Vampire {
public:
    Vampire(const Props &props)
        : location(props.location),
        birthDate(props.birthDate),
        deathDate(props.deathDate),
        weaknesses(props.weaknesses) {}

    int getAge() const {
        return calcAge();
    }

    int calcAge() const {
        return deathDate - birthDate;
    }

protected:
    const std::string location;
    const int birthDate;
    const int deathDate;
    const std::vector<std::string> weaknesses;
};

// ...there was a guy named Vlad

const Vampire Dracula{{
    "Transylvania",
    1428,
    1476,
    {"Sunlight", "Garlic"}
}};
