	rxSubs.add(service.getTorrents(_dispersyCid, 1)
        .subscribeOn(Schedulers.io())
        .retryWhen(MyUtils::twoSecondsDelay)
        .flatMap(response -> Observable.from(response.getTorrents()))
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(new Observer<TriblerTorrent>() {

            public void onNext(TriblerTorrent torrent) {
                if (torrent.getInfohash() != null && torrent.getSize() > 0) {
                    adapter.addObject(torrent);
                }
            }

            public void onCompleted() {
                showLoading(false);
            }

            public void onError(Throwable e) {
                MyUtils.onError(ChannelFragment.this, "loadTorrents", e);
            }
        }));
