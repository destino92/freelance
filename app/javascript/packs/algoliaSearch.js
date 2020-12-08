import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

const searchClient = algoliasearch('4PQHYRMCTI', '16e3bb87a2c2cd2f0240df14053c2e13');

const search = instantsearch({
  indexName: 'Gig_developement',
  searchClient,
});

search.addWidgets([
  searchBox({
    container: "#searchbox"
  }),

  hits({
    container: "#hits"
  })
]);

search.start();
