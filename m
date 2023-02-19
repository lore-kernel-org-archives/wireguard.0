Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA86C05027
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 20:23:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64d07d9c;
	Sun, 19 Feb 2023 20:17:19 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2417d403
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 20:17:17 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 701921FEAC;
 Sun, 19 Feb 2023 21:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676837816;
 bh=8oW+7Lu4Knf3pQHleNE5IVE5LmpzPeP+tNCJZgaHVZw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=CioXTghNwOcMQVBiLjCmnI3Q0tdlCO2VaZqctF75ztFoBWwU4O33QadejYN+WEGgU
 6bJ9ccpA073oip9lxBaZvPao8vVEv14v9cGWhzLbI6YCDLgOi5l2AR1gqHseDNbs2O
 osZ44YTQ6xoPblJ8T0GdKsvuKO1nPqB8XPeaf5tuV+ilbqnbynHNuMJONne737QtG2
 3dL4IrumPl6F1w7HkSy4z5yPgnN8Sd83XJ/aI80xZDf9xRUwThW+ZwB4dUqtc9giAu
 VnPQdjx1J+TcaLwX3tfJFBw9FPVF4y3iwKvNRYpcPpIPOK1QIqEvEeDrDPxwvdDAmL
 016g3+NEN2ZBg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 94FEA14C0119; Sun, 19 Feb 2023 21:17:15 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <00b94fdf-22d5-00ad-e068-30ad4a453236@keff.org>
 <CAA6-MF9q68pdBZDojmA+DOsH-WOckyv+J4jD+T6zBZot2Grz6g@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Janne Johansson <icepic.dz@gmail.com>
Cc: Sebastian Hyrvall <sh@keff.org>, wireguard@lists.zx2c4.com
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 21:11:20 +0100
In-reply-to: <CAA6-MF9q68pdBZDojmA+DOsH-WOckyv+J4jD+T6zBZot2Grz6g@mail.gmail.com>
Message-ID: <87sff176lw.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Hey Janne,

Janne Johansson <icepic.dz@gmail.com> writes:
> *) https://en.wiktionary.org/wiki/Chesterton%27s_fence

I am happy to have learned a new principle today, thanks for that.

And to be sure that everyone is on the same page:

    Wireguard should reply by default with the source address that
    used to be the destination address, but at the moment wireguard is not
    doing that at the moment.

If anyone disagrees with above statement, please let me know.

--
Sustainable and modern Infrastructures by ungleich.ch
