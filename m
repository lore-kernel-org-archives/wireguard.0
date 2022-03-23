Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B9C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:48:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 95e8f04a;
	Thu, 21 Apr 2022 23:48:44 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0cebe831
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Mar 2022 20:08:02 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so1838259otk.8
 for <wireguard@lists.zx2c4.com>; Wed, 23 Mar 2022 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=L69q5oQYaRpqpFBtuidEkFIRV9lGg80sr6JO6MsvG6k=;
 b=mAcbnGuWsh3BIYJ75+MOfYnEGvJEu4eABt4vQ+9px07TUGbIxk0wIkCFWDylxKVtFV
 nwZDbrbbJF2qlcJYdlyoZNgzBUITu1CO2AI4iPkfON5CytCnZW7vGXOmZJq+EI36I6Lq
 zkhxxaSSzMLMSlUOcCbURuB2n3DrRq+UT4L26ZmqUR+yYn6wRvSYcdZHqscCJy0zxAQd
 Qr0WRHcIg0WRVsWXa2ibLxpNoNNFYOlF0IBpTxZGEIEYLTafmEp3mVLqJiwN7hwetju4
 Dh31LSVQ5b/gBPsJzqeU3fnEOIO4SlKQ1KVblZBKUXEomUc4aNqaS07vPlwVLdatx2XP
 7cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L69q5oQYaRpqpFBtuidEkFIRV9lGg80sr6JO6MsvG6k=;
 b=6cBAl+LP74C5dLngCyJmrmQGy1h/dMyR5qRK57YF9HMXZ9xNgnL8NDutMstgGx48V/
 OHQqVECV1X/8lI/jReWRvblhlx4C4SVm+bUZ46GKcPd3ZYRg48RMgTZLA5+t+Fg259a9
 0QF8mH34cy/CwaGbO5NLg1N42RIo9aezyhQtmADjqcbQaT8UYxoGqJD8Fqd2sLwEZgXw
 E8ksPITVFmv1wfNfMKrKZ2+aWLGj8K2l/ABeYgULyprwB7UVIfC8sCYqu8jDT0RzFO9X
 7zSCeeXuvRpEkp75EdD17M1g8mz63jAygifteVsp4QmiOjgP8Ac+iOEZwy3vmOqimBUK
 m1Cw==
X-Gm-Message-State: AOAM5339BnCB2lb2JvLdDjG1lYGTilWDZYv39wv247yFSpHLaBJyYpAA
 n3yUlJYONSAGurtjGk5EwtQDAMe9PZPgaolu124mgCa4
X-Google-Smtp-Source: ABdhPJxASUXF5fVcMOb0t/61BFGzYHh9SBOY4yOvn+8kWIV2K74DbrETbAQsT9VaiPmmHoQX+R0Kkns9Ktxgd6KA1Wo=
X-Received: by 2002:a05:6830:4d0:b0:5c9:6679:fa0f with SMTP id
 s16-20020a05683004d000b005c96679fa0fmr753198otd.184.1648066081295; Wed, 23
 Mar 2022 13:08:01 -0700 (PDT)
MIME-Version: 1.0
From: Barry Cisna <brcisna@gmail.com>
Date: Wed, 23 Mar 2022 15:07:50 -0500
Message-ID: <CAL0AYvfw6EoUJy21pOcH9NOA1zh4zttrpZhiLsQar32VuNoEiA@mail.gmail.com>
Subject: WG IPV6 problem
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

Hello All,

Have Wireguard setup as PEER1 on an Debian Bullseye machine residing
on Google Cloud instance. IPV4 only,,
PEER2 is the home Debian Bullseye server  behind cgnat cellular provider
After a learning curve these connect fine and PEER2 does get the PEER
1 public ipv4 address,,,with a US Cellular hotspot connected to PEER2.
BUT on the same PEER2 if i use a T-Mobile hotspot ,,,again
CGNAT,,internet does still work fine and can ping PEER1,,,BUT does not
get PEER1 public ip address.
Only thing i see different is the T-Mobile hot spot is set to IPV6
only in the GUi settings of  the hotspot. I did not in the Network
manager gui setting of PEER2 the IPV6 is set to 'IGNORE' I havent yet
tried changing that to 'automatic'.
What would i change in the PEER2 Network Manager config to make this
work with IPV6?

Thank You
