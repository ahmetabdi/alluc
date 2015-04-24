module Alluc
  class Search
    # PARAMS: searchtype:string count:number from:number getmeta:number queryL:string (url encoded)
    # query - the search string. All alluc search operators can be used (https://www.alluc.com/about/). Make sure to urlencode this.
    # count - max-amount of returned results. Can be between 1 - 100.
    # from - where to start. For example if you want result 20-30, you will set count=10 and from=20
    # apikey - your apikey
    # getmeta - If you want additional info on hosterlinks and source, set this to 1. Only use if you really need it as it might make for slower queries.

    # "status": "success", 	// Status, success or error
    # "message": "",		// What went wrong? empty if success
    # "result":[ ]		// result of your query. Array when using /api/search/ and object in all other cases.
    # "fetchedtoday": 174	// Amount of links retrieved with your apikey so far today
    # "resultcount": 1	// Amount of results for the current query

    def file_data
      # https://www.alluc.com/api/filedata/{filedataid}
      # Request more information about a hoster-link. {filedataid} is returned in /api/search/.
    end

    def source_data
      # https://www.alluc.com/api/sourcedata/{md5-of-source-URL}
      # Request more information about a source-url (URL where a hoster link was found)
    end

    def thumbnail
      # https://www.alluc.com/api/thumbnail/{imageid}
      # Fetch a thumbnail. {imageid} is returned in /api/search/.
    end

  end
end
