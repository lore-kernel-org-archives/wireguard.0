Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EC2C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:36:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 308BD61165
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 308BD61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d037f41;
	Sat, 10 Apr 2021 14:27:35 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71f6082d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 17:54:20 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so3106634otq.10
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IH6mWvUJxFTDt7I1Z0v6rqdN5Vl2IvUuEmfzjm6tnpo=;
 b=IBDJKalwOPAhkQtD8TJF2T9vzqsQSjFHops4aqxOogUBOMfkw26/StSoz/R3iA+5u2
 12BANiOEwQyan9BRVoFLmdIfHnM8+qlCj6xaWlbVqceqhgW9eroqsmGWfmFDRnbaOAyF
 K3WzirDrHKHbqSper6jO+XP2Zkz7g2wS8OJpDkw+LoOM92e3OSeGARiuHs2RZws1jT1k
 ED87foohMa087SMzqiVFaRidax/5SpSBS46nFUpX6S4KMBXWXGoyf8QAmij3sLuDdWWN
 7IiVu4fbZaWj94y546uLYby+Kx7t3XVzCrq6hiWsjEFBzQ/iIpD5G9haCt+Xyh66bVTn
 fJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IH6mWvUJxFTDt7I1Z0v6rqdN5Vl2IvUuEmfzjm6tnpo=;
 b=SiDGiFXYHUgDJsaNUqXdy6BF8yvN9FFjR2VmHgSUS3WUlximzw42MTCfeOgI+2kN3R
 nwOQNYGvOKM7ndJ7tvmKd0+84Vxk0SfVt6qWgIudoO4ee0EX6Dps6JnXgqfRpovxe5Ji
 2gsoLLJzktgFkZ1uk8swvH8IvDyqx0nXV+v+D5U2nPPu5Cfje7scKpyyYPTP0F38PRPR
 AAVr227Mhu4SmTaJmJrkIbUdi7XtYk1OG8rLo9eFhr0ki0ZLJeSVDHxg/ZsYXwbOuBR4
 Uhouk1J5G46VRl2f0One1VEO7sWnB+/iYeeX1qBa67HX8x/b4Z6LgVxMT2bXDewoCQc1
 lqvw==
X-Gm-Message-State: AOAM5321tEmGJX6M56M1NgQ7z4jXaw+F054YwajKYmM7abzzZq/Pshzt
 LTkNaiclOa/ggG2LAESuAv/H5571rd5ahpoevRM=
X-Google-Smtp-Source: ABdhPJwX9Csh4JtiOFvVKN0rwF/MJgDQQzOTsGWkxi5oy8NT98J39woorW97HLCpLN63WI0nHAx09+GnIQmedJFwwlc=
X-Received: by 2002:a9d:5e92:: with SMTP id f18mr8844128otl.24.1617904458688; 
 Thu, 08 Apr 2021 10:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
 <CAOw_LSEasJuHDPXGkVQnYh_aHd+nOY53D0LRUXuH+pN45ynz2w@mail.gmail.com>
 <432300ddb79fffb1586ccac6852fade4c2d47db0.camel@infradead.org>
In-Reply-To: <432300ddb79fffb1586ccac6852fade4c2d47db0.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Thu, 8 Apr 2021 10:53:42 -0700
Message-ID: <CAOw_LSH1pnGXyZA=tYMvBdjXQVP1ZzTTXtk002AjsswTh=qpdg@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

On Thu, Apr 8, 2021 at 9:59 AM David Woodhouse <dwmw2@infradead.org> wrote:
> Hm, your description doesn't match the code I see at that link.
>
> You're using GetAdaptersAddresses() which gives you the UP/DOWN status
> as well as the addresses, and you iterate over those. The loop is
>
>  =E2=88=80 adapter, =E2=88=80 Unicast address on that adapter:
>      Check if it's our Legacy IP or IPv6 address.
>
> That isn't O(n=C2=B2), is it? It's still O(n) of the total number of unic=
ast
> addresses in the system?

It's O(n=C2=B2) the number of unicast addresses, because there's an extra l=
ayer=E2=80=A6

  =E2=88=80 adapter, =E2=88=80 Unicast address on that adapter (iterating v=
ia
GetAdaptersAddresses)
      1. Check if it's using our Legacy IP or IPv6 address.
      2. If yes, then check if the other adapter is UP or non-UP
      3. If non-UP, then=E2=80=A6
          =E2=88=80 Unicast address on the system (iterating via
GetUnicastIpAddressTable(), since the other one maddeningly lacks an
API to delete addresses)
          2. If non-UP, then steal/delete/reclaim the desired address from =
it.

> Once you've found an address which needs to be removed, you're *then*
> using GetUnicastIpAddressTable() and searching through the results to
> find the appropriate MIB_UNICASTIPADDRESS_ROW that you need to pass to
> DeleteUnicastIpAddressEntry().
>
> Does *every* field in the MIB_UNICASTIPADDRESS_ROW have to be filled
> in, or is it just the Address, InterfaceLuid and InterfaceIndex? Can't
> we get those from the table we get back from GetAdaptersAddresses()?

Yes, I already tried precisely this in
https://gitlab.com/openconnect/openconnect/-/commit/b3dbabda7b68cf86fc72e2d=
5158b0707f74d61f0,
and it doesn't work. I could faff around with it more, but even if I
got it to work, it's clearly not how Microsoft wants us to do it, and
liable to break.

    /* Create a "fake" MIB_UNICASTIPADDRESS_ROW based on the
IP_ADAPTER_UNICAST_ADDRESS and IP_ADAPTER_ADDRESSES data structures
which we already have. */

> Alternatively, can't we start with GetUnicastIpAddressTable() as my
> original code did, and if we want to check whether an interface is down
> before we steal the address from it, use GetIfEntry2() to find out?
>
> Using GetIfEntry2() is probably a saner way to find the InterfaceIndex
> for the Wintun itself, which I was dredging the registry for manually.
>
>
> I'd like to be consistent about clearing the 'conflicting' addresses
> and setting the address on the Wintun interface. Whatever we do in
> OpenConnect for Legacy IP we should also do for IPv6. It looks like
> you're clearing the conflicting addresses for both families, but we
> still aren't *setting* the IPv6 address from the C code?

Let's save the OpenConnect-specific decisions, but=E2=80=A6

It seems to me that we've identifying a couple of tasks that many
users of Wintun would need, and which are (in my opinion) quite
tedious to implement robustly in Windows:

1. Identifying the =E2=80=9Cinterface index=E2=80=9D of the newly-created a=
dapter (for
use with 'netsh', etc.).
2. Reclaiming desired Layer3 (IP) addresses from other non-UP adapters
to which they may already be assigned.

If the Wintun developers are amenable to it, these both seem like they
could be useful additions to Wintun itself.

Dan
