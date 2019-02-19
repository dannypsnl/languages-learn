#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef enum {
  Spades = 1,
  Heart,
  Daemon,
  Clubs,
} CardType;

typedef struct card {
  bool faceup;
  CardType type;
  unsigned int value;
  struct card *next;
} card;

card *new_card(CardType ct, unsigned int value, card *next) {
  card *new_card = (card *)malloc(sizeof(card));
  // avoid deference NULL
  if (new_card != NULL) {
    card card_v = {
        .faceup = false,
        .type = ct,
        .value = value,
        .next = next,
    };
    *new_card = card_v;
  }
  return new_card;
}

unsigned int counting_cards(card *c) {
  if (c == NULL)
    return 0;
  unsigned int counter = 1;
  for (; c->next != NULL; c = c->next)
    counter++;
  return counter;
}

int main() {
  card *c = new_card(Daemon, 1, new_card(Clubs, 2, NULL));
  printf("amount of cards: %d\n", counting_cards(c));
}
