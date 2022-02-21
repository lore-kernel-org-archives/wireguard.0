Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC34C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 18:10:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bbb7d9a0;
	Mon, 21 Feb 2022 18:10:32 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 08f6801b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 18:10:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y24so7786321lfg.1
 for <wireguard@lists.zx2c4.com>; Mon, 21 Feb 2022 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=/M65cHXNy8uQlDac4cjrffO15vaM8zKoMp0khKgvzyU=;
 b=iBqRZ1uOV1j5FacfRQp0grdLyPXkFOTwxWf6c6GCzu7PRMWXsWukFDBQCp6J2O4yXE
 Z9EeGNTxRLdQqT431U0LFwjw2q8L8JchaPjFgtJwu/BobZbiyYS9mfHRP8MB1ttLoIcV
 S1TLSwR5fggfIFAsTsYyqcF+JV1Bc3CTCNY6DWKxTE2NaKtKKgSCvbhmZbPN7LGj6dZL
 AdZBhL9z7sFtAL62vr5diafI1n7prhFBTDGiwotpJra+06ZsNZSma5U1F/TP/w8MYJs4
 pfTtNk1hf1DSeTvs/1Jhs0bd7a5bUpwRwSE/JP2w/V2BabJXnQ8IfBmwsVlQVtRX+q7B
 PkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/M65cHXNy8uQlDac4cjrffO15vaM8zKoMp0khKgvzyU=;
 b=2scNbqsv5zSEa5K9L8CSkaPz5+5sFaX3ek76/Bk9DfGqtkSnVl1zLB/kIeQucHy8R7
 GOCUAGpCNYAaajk5PlOesqqdLChdhmA6PA3dOMVP75Ko3f1bdxV3J2gn/qp5FTDaEJi0
 qUmLciaQXxeStFH9dUcBpgjefIlxsM4iTDgBqtiQJtXUtKFsA1solCi7MBQh1XnzuA3G
 Z7JwQbVZWD9Hhvm6OJoT90qUFe5lL0gxDKgwBh/cVS2l18139K9XKpkqK+C6IOseGYyQ
 tiYmADooVi8PsY6Vlte3AzNFscjMerDZbwGV454pGTzmM26Da6VrWkgh+/5RX/wID+XF
 C7Kg==
X-Gm-Message-State: AOAM532ia6rKc7+EtQ6Ya5K+/QkCP1afzhLeXHypQHYnNgUHp7JDdVov
 m62ZzpbHMzhuQ/4oQLLl730Ls+NKU3nkUM4XWfPb3eLA347Xaw==
X-Google-Smtp-Source: ABdhPJz6L50Z5VaFlKRHVtmu+9AapiJB592PhVz3/mMTFEiz4CqVElJ55tGKuTuAYfIc+ezh+MpYCOeCRBgVissfvzg=
X-Received: by 2002:a05:6512:2291:b0:442:be5f:d3bb with SMTP id
 f17-20020a056512229100b00442be5fd3bbmr14652975lfu.301.1645467030032; Mon, 21
 Feb 2022 10:10:30 -0800 (PST)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Mon, 21 Feb 2022 10:10:18 -0800
Message-ID: <CADjMg7VnZd8sjAR82Cd5MUM2LeFa+af6Gp0RJBT50azwq4ETEw@mail.gmail.com>
Subject: Wireguard netstack client/server
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

Was trying to understand the netstack related examples in
wireguard-go/tun/netstack/examples/

Examples for netstack available in other distributions, all do
createNIC using the fd of the network on the host-machine or likewise.
So packets enter/leave netstack through those interfaces.

With wireguard-go/tun/netstack/examples/   I dont see any interface
created on the host machine, then how are the packets enter/leave
netstack where wireguard devices are running? Plz advice.

Regards,
dev
