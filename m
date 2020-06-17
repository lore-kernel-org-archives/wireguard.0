Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E166C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:45:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D52B12168B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vro3vFZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D52B12168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b8b0e17;
	Thu, 18 Jun 2020 00:27:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57bae42f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 00:27:03 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b68333d1;
 Wed, 17 Jun 2020 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :content-transfer-encoding:in-reply-to; s=mail; bh=eWQhk8zJwht/G
 /oilvcodqKSWV0=; b=vro3vFZoOrj5MGf8OidubiAKbo2sPtOmqXoTmdUuey97P
 +yoO7sSMvc5/YXOhZ9WJlubAmnMFrwxZJGZbYGZAowufHxU+SUWR7yFm4RnH1/dz
 trhhxf+exVii9gFK8WRgfBZ0bI07acSTIfVXEhqE5+SghuvW7bW4KzC/VDhXl0JO
 QRQHuYqr3tqRXC14FnxrfyR4SBOXm5bzo1Z1rCnVMzqLrWrGl7cVrcHzmZQZ6dsz
 Fr31BqDUpVFczNlaJJ25pm0UVI/ilJaccBPA0M3xCZVCy9gJSrST4iva3EuBukHO
 qfT9rv5vFWy4j4zDKbBIU61PU3LGKIWntOUf+bJCA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7760fad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 17 Jun 2020 20:27:03 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:45:10 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 wireguard@lists.zx2c4.com
Subject: Re: wireguard: unknown relocation: 102 [ARMv7 Thumb-2]
Message-ID: <20200617204510.GA396261@zx2c4.com>
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
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

On Wed, Jun 17, 2020 at 02:33:49PM -0600, Jason A. Donenfeld wrote:
> So, some more research: it looks like the R_ARM_THM_JUMP11 symbol is
> actually wg_packet_send_staged_packets, a boring C function with
> nothing fancy about it. That github issue you pointed to suggested
> that it might have something to do with complex crypto functions, but
> it looks like that's not the case. wg_packet_send_staged_packets is
> plain old boring C.
> 
> But there is one interesting thing about
> wg_packet_send_staged_packets: it's defined in send.c, and called from
> send.c, receive.c, device.c, and netlink.c -- four places. What I
> suspect is happening is that the linker can't quite figure out how to
> order the functions in the final executable so that the
> wg_packet_send_staged_packets definition is sufficiently close to all
> of its call sites, so it then needs to add that extra trampoline
> midway to get to it. Stupid linker. I'm playing now if there's some
> manual reordering I can do in the build system so that this isn't a
> problem, but I'm not very optimistic that I'll succeed.

Looks like my explanation there wasn't 100% accurate, but it does seem
like the issue occurs when gcc sees a clear tail call that it can
optimize into a B instruction instead of a BL instruction.

The below patch avoids that, and thus fixes your issue, using a pretty
bad trick that's not really suitable for being committed anywhere, but
it is perhaps leading us in the right direction:

diff --git a/src/send.c b/src/send.c
index 828b086a..4bb6911f 100644
--- a/src/send.c
+++ b/src/send.c
@@ -221,6 +221,8 @@ static bool encrypt_packet(struct sk_buff *skb, struct noise_keypair *keypair,
     simd_context);
 }
 
+volatile char dummy;
+
 void wg_packet_send_keepalive(struct wg_peer *peer)
 {
  struct sk_buff *skb;
@@ -240,6 +242,7 @@ void wg_packet_send_keepalive(struct wg_peer *peer)
  }
 
  wg_packet_send_staged_packets(peer);
+ dummy = -1;
 }
 
 static void wg_packet_create_data_done(struct sk_buff *first,
