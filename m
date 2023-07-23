Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BDC001B0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Jul 2023 16:27:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2d8cab0;
	Sun, 23 Jul 2023 16:27:38 +0000 (UTC)
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c91482b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Jul 2023 16:27:37 +0000 (UTC)
Date: Sun, 23 Jul 2023 16:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail3; t=1690129656; x=1690388856;
 bh=GrbhGtC0hPFsBzZWdsxh+7Rticnyn7l2pijynpbU2ok=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bY1FiLdR88O0wgyslnpebo7LlgqFZKqFsFadPnBg7241GDnlVX+fkT0oKU+T1N5JO
 kSXpUwBct5Uzqdr6RrJREWyy5UJUPdh/a5AMnJKbUgmx58urXbhMCWF+4YfvaxVYkF
 HTWfvCgyi0PwldfArfzV9S+uBkAReFOmewHS3Ydkjgch2ZM7eKKt7KAnnqARt6WkrQ
 geZv2p/HFiH59Qinc3T26zaevFjrwYgjmf5HFD7e5gFctoktNjJzqXgKgxm35L2VZX
 DuDstW8CcAu+F0PFhzUhbAa+IcXXgC3pDcVr5rjgJoFDt2KoH05Zng55qMWTQla1Nx
 KdgKF3ZEuelBw==
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Subject: Re: WireGuard Mailling List
Message-ID: <JxWHQoPbe6yp-PphvO9y5GXGICRGLMS_J51rZ869XRdYRGR5r3yj10OmaJBgE6v_ltrWdMjg63dzAo8XtTw5MSWWPGhCsKnz-8qRHg-HaH8=@protonmail.ch>
In-Reply-To: <CAHmME9rzmyZzAETFGm7NGZ9FBhgSueskgmUD7Q17SOSe=zXtzA@mail.gmail.com>
References: <20230719091342.789107a9@parrot>
 <CACT4Y+bsdEDukXi02RKWuEa-BYajP=4w5B-7KEUqf--HOVPVjg@mail.gmail.com>
 <CAF75rJA4ev7f9L4qm4LgKAe2xS5vyb7z=vrDq0RN_WXbOX_0kw@mail.gmail.com>
 <CAHmME9rzmyZzAETFGm7NGZ9FBhgSueskgmUD7Q17SOSe=zXtzA@mail.gmail.com>
Feedback-ID: 9341368:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



> It is absolutely none of those things at all. Please stop speculating
> and keep discussions on this here technical.

I mean, the speculating muppets couuld have at least Googled it !

For the record, for people who are too lazy to Google Jason already answere=
d the question: https://www.reddit.com/r/linux/comments/hzyu8j/comment/fznp=
3md/
