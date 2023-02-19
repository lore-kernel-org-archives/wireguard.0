Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EC0C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 20:26:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9ee634b;
	Sun, 19 Feb 2023 20:24:23 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9430b654
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 20:24:21 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 144311FEAC;
 Sun, 19 Feb 2023 21:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676838242;
 bh=AR8hZViDqytqURjkIvle9A5XOb6AXBJufv/qtUNjhLE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Yjo0TiLjdgTBWFfmrV082Wpilvr8ZtHeWw5PH1LN160vCo+S3ZQBFY+aNBqNxmJP4
 HwjAtDFwmrGlNxav1vM48+STKqM4bO+kvRxTRq3+DIGy4uIYL7TXyo0f6XpmxuMikm
 jTvdn+6tUMOuEbAQ4zFA5mQLRLteLC09DpboBDMBqmO99W0qdjmpY7c+qsdtLpzu1s
 SWzx14ou70rg6PvNa2PcrZS0KvlMrQOB/pYQ3uO/bmsrVHdo4DgrsD4RQ6zysOUWV0
 yMPHK0Jw6tTG30OszgjID/djsKvbacsDO+yLExuYUNlK6TMXsfKEFi9CJd4FfVwqAH
 qCaKRs1HJBshg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 3343A14C0119; Sun, 19 Feb 2023 21:24:21 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
User-agent: mu4e 1.8.9; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: tlhackque <tlhackque@yahoo.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 21:18:34 +0100
In-reply-to: <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
Message-ID: <87o7pp76a2.fsf@ungleich.ch>
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


tlhackque <tlhackque@yahoo.com> writes:
>> [...]
>> 4.1 <https://www.rfc-editor.org/rfc/rfc2181.html#section-4.1>. UDP
>> Source Address Selection
>>
>>     ***To avoid these problems, servers when responding to queries
>> using UDP _must _cause the reply to be sent with the source address
>> field in the IP header set to the address that was in the
>> destination address field of the IP header of the packet containing
>> the query causing the response.** *

OMG, we really have seen everything already, haven't we?

Jason, what do you think about adopting the RFC2181 Source Address
Selection algorithm for wireguard?

If I am not mistaken that would mean in practice:

   if orignal_pkg.ip_dst == one_of_my_ips then
      return_pkg.ip.src = orignal_pkg.ip_dst
      return_pkg.ip.dst = orignal_pkg.ip_src
   fi

For me that sounds like a sane approach (aside from
my very simplified algorithm).

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
