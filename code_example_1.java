    @GET("/channels/discovered/{dispersy_cid}/torrents")
    Observable<TorrentsResponse> getTorrents(
            @Path("dispersy_cid") String dispersyCid,
            @Query("disable_filter") int disableFilter
    );
