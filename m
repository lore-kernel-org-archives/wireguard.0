Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C9CC55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0CC2065D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eueSiVb3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0CC2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a0f4354;
	Mon, 9 Nov 2020 22:41:03 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 52a78ee0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Oct 2020 03:37:15 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id w27so5218403ejb.3
 for <wireguard@lists.zx2c4.com>; Tue, 27 Oct 2020 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JktTXhRAnD0CiSAIRXnfOqzuax9RzJULn0j/jQ5tMZ8=;
 b=eueSiVb3+5bFjX36dCuAyYOBa9eymt5CvAkiYp2ZXWHsZ6+mw8J5WHawQBXc2E+hxJ
 sVoWFr73So2EiTFk1Spjs5eLI/fP+sNVAexxASRGZ4CiZUvbjxM5h5YT5meRveTb8ILM
 ybqZ9r09yF1JYUaHTS3zeAsYUTmJS803QmII8Ut4Uzmm3Nz/89yL7hCLFQcteyrcW8Cf
 SfvD5MHcrz1Guv7rO6GHqNB3QfWQlchRFLL9kBdzaLMrF92Q82xmmUwUl2+l+dhuhZ/o
 efPJz8WvURSFxRo6IumqLfyTqpOAjzmL9Ys1IKYa8i8WLBiMLcvlyPdBSQ2NN3ijThMU
 6uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JktTXhRAnD0CiSAIRXnfOqzuax9RzJULn0j/jQ5tMZ8=;
 b=CgQnj+TJ2/Y+jha7JCuEKba4YxoZ/zQhyujMraWTzjbbqNXfP8TyEgYxM4GXT79BEo
 n+cJnoArf0yr+MZPuTr+2tAyiCnKcMS+/ONG4riJuDQPdjudrJ7dPKDPWFtl341aJ4y2
 jXxK+r6HQTP7+ZmETK/iB7O7rf4nroh2TBjGo3UcN7cWOQuPUIJJ8BF4tQiQ7jCY3zqU
 +9FyFDoqef/ZRIcl0tKF9jIMYcd5smp1e39VHXCsM8tg5UwyRMxkVdyVNTqyecmxEsaG
 vkrNYCmAZztFgnFW5gYTD4q5/b6hZZO9YCJ1872ECPX2zgInxiUYgw6AzuOiSEPNPyv+
 cMjw==
X-Gm-Message-State: AOAM532UtTNSKXpReLF17ymkuQE5qhKAt7Ou61UkIn1BCnGn6gbkh9JF
 xuEQQ+ArkrBjR+gDTGE5oRDQSk7h/LnT1ZC/Wym6rTUFUHC8bA7i
X-Google-Smtp-Source: ABdhPJyXml6fk78uszzVL1bHk6LIdK449P6EH2UBgEmhNiqG3wQrzQCEaqPnJa+RD45TKh4hsoGlaGx8qBm1FdzrF6E=
X-Received: by 2002:a17:906:7210:: with SMTP id
 m16mr5845719ejk.490.1603856352030; 
 Tue, 27 Oct 2020 20:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMucfLzDBf_AEqDrNsQXCN1gb0C-39c-HnJGBuKJktxYZa2KQg@mail.gmail.com>
 <10a379b2-fa4a-a178-7f5f-43e5b111be6e@sholland.org>
In-Reply-To: <10a379b2-fa4a-a178-7f5f-43e5b111be6e@sholland.org>
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Wed, 28 Oct 2020 04:39:01 +0100
Message-ID: <CAMucfLz+ueE4uT_fwf2=QBPWk8vWq3jmdt74+4WbYuYqMbuZ6g@mail.gmail.com>
Subject: Re: Using WG to route between two LANs
To: Samuel Holland <samuel@sholland.org>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:41:01 +0100
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

On Wed, Oct 28, 2020 at 4:22 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Hello,
>
> On 10/22/20 10:43 AM, Dashamir Hoxha wrote:
> > I have created a network as shown in this diagram:
> > https://cloud.flossk.org/s/ZsLtNLsxmo8rxPD
> >
> > The red arrows show the WG connections. Only the server has a public IP.
> > From client1 I can ping to the internet and also to client4: `ping 192.168.0.3`
> > However I cannot ping to the LAN IP of client4: `ping 172.26.0.2`
> >
> > My ultimate goal is to be able to ping from client2 on LAN1 to client5 on LAN2
> > (both of which have no WG configuration and interface), routing through
> > the WG network (client1 --> server <-- client4).
> >
> > Is this possible? I think that it should work, with proper routing,
> > but I am not able
> > to figure out the proper configurations. Has anybody tried something like this?
> > Do you have any suggestions or advice?
>
> Yes, this is possible. You need:
>  - LAN1 needs to be in the AllowedIPs for client1 on the server
>  - LAN2 needs to be in the AllowedIPs for client4 on the server

Thanks Samuel. Actually I figured out that I was missing this (LAN1 on
AllowedIPs for client1 on the server, and LAN2 for client4).

https://gitlab.com/docker-scripts/wireguard/-/blob/master/testing/test5.sh

>  - A route on client1 to LAN2: ip route add 172.26.0.0/16 dev wg0
>  - A route on client4 to LAN1: ip route add 172.25.0.0/16 dev wg0
>  - Routes on the server to both LANS (same as above)

Actually I am using `wg-quick` and it adds these routes automatically.

Instead, I have to add routes to clients on LAN1 and LAN2 that don't have
WG interfaces. For example on client2 and client3 I have to add:
`ip route add to 172.26.0.0/16 via 172.25.0.2 dev eth0`
And on client5 and client6 add the route:
`ip route add to 172.25.0.0/16 via 172.26.0.2 dev eth0`

>
> A gateway for the routes is not needed. Once Linux passes the packet to the
> WireGuard interface, cryptokey routing (AllowedIPs) is used.
>
> You do not need any NAT.

That's right. All the WG network seems  to work like a router.

>
> Cheers,
> Samuel
