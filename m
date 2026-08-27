Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E703C61DC4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2026 13:36:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4d453f44;
	Thu, 27 Aug 2026 13:33:10 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 80321357
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Aug 2026 13:33:08 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-52d7a3defe8so14482831cf.0
 for <wireguard@lists.zx2c4.com>; Thu, 27 Aug 2026 06:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787837587; cv=none;
 d=google.com; s=arc-20260327;
 b=rKQ9n+WF+IlLTAILuirAZ7FvOIkB7zXr1dld0TXK7fpqIYoX1af4y36yy9Nd+dAp/X
 s3QjaRzp9YDcEj5ZEglUL36NvMhKMAiNr8VdKVpJ+L9yB464pDRYol/Hdz3B/xKM0QDd
 b5yo8fNxccUiP2yOiqlwmMJsv0ECMTTHJh02Ae0Q3K6daHn+GKAzxp9fV1PyURrDHSRb
 Pm6uPxyCwslnrAD6eEUOv6pbdONDSV15IFOLwoZ4A89AFeNyVBItHOCVU5CcdaOWqw7l
 r3WA8NPFG9XXxLwNWBqlDRsCyPqRnYTZ2K0bvwKo1v25lHEjUZ9HlvsPMc+gkK8/Z62G
 yZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
 fh=O0FSn1b7CyYv3ROLDFuW+kbnMSBcMjYvUTsMSBlq0Dc=;
 b=k1AFnjtPDPySaxEggWbkPQ2c+TmqfFR2skr5Y9jsp2se79UtZI8iXmqI399bis7YSw
 6xsfSLYGsMA4VMpPQXdOjIEtwzndqm3jSTHAmX4CCgMDTAaLFGQdGG3W3eTzSCxibmSD
 lJEr6e0aRXm4+K7HxEwlG4UZm1iJomkUOLy8RMVw5LUA0F9D/42JSacRTPMWMxbuo9xb
 uadgnPzs+PknwrLp47FUw74XOTaGLrYZoDMkXrvsvcGTyF7AlBUYT2fn9LSvWgpUS/eL
 NVAdviZxeFCfyk7FWMTrLryW6VoDNIc7kPvW0WJvbIGn+QBBbAbifOl3Pk2wtcxo5cxl
 x3dQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1787837587; x=1788442387; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
 b=gedrA5XHq8UjtkNaQQ9AGUXE3JGHLdrHkgF9sen8quhV0KA8A/faGPazmOs7MQxuMN
 EqL6yEotUfj56cG18uxSnrsgosgYQivqCgWMMMDzwnvmTx2ozh0urj4x0Jpx+zMVsXAe
 /bPTdxLFVc2wnGDtpEGLhp5SZHIg4U8gwYSLBuMfr0nZH0KQdNQD191bvF+NE1abklOd
 Q0t0BCIOP4YlA51V5TxROR6FeWgx6L7HYwiEvHtYSYm0HdWR6y/ZgnLP9cH/3v3vKZVH
 gKuPr46ESLlQqJpwuPXaO20XG6Wlqp+P1h74FIZWAkQkgxSWiEjJw5UO9VcDVZkoSEJk
 hTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787837587; x=1788442387;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TPXhT/cNmuvLcD38iQd3+f5EkAYP1aCkwHKjXM2QWsQ=;
 b=P0mQSMCIhUdEluMMwcWBKUHN2JCJVKJxgookSQ19klm3jER3VBePSPTplvX5O4oc66
 J/7dD5zJGc0nNH2bf2sKA93gHCcDsh4PRWpX5uUK+yz6JUstcJpSPMKV0CQiq0Wx59bJ
 MNqCn/V1DZvtOG2zYiVrAt9mev/YvAsV63eqRuvJ0vxPYnjgOna23ujjkNybuYW3a46k
 Y5gdHJ0ImfmflTRpgcDBYEtGKUeuZojzkSf2xOSfE2D3Z8OWyqP+njG87N27N7iHNZcK
 3XBhqLmg7Lg8vLN8PEe35tSnPKBPZAIIFiwvmiXqDU1nA83VZ53zvMXix/dUmzMu8MA/
 0Yjw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwekcIlkElrPLGXHAOmKPjoeddojxuQZj/QJaI9sFe6nwaORvtz2jaxOpbwbrWyrIc1eyEc1kab78=@lists.zx2c4.com
X-Gm-Message-State: AFuF++mZpt9mc5+8L2KM1BLBgo5IcnA1Acd9HJPDuzw1eZMFUZXV9raR
 wkQzYAxx9XUwparw2P+ivA4sPbPIGdAr25LIk4OfQQUPpWGqZda4UVNbpkTRxJt6OijVbcIUgk8
 F0Oshw3Ya7K7zPnJhTsxFBPtTaE1jRNgXE1a7hcXH
X-Gm-Gg: AR+sD10NfMZzdyL0ZbR3DmzWGeCwmsM/5Xp5uU7jtvzUOF3X3GQu7o4ZAHMPmb6soy+
 /UfgyR4PgBxTde0piqRDihmAwlvyZkt1O6mzU//Abdaydd+1lBKE9ov+P7jA4qiG7LYmucWJPc+
 Y5KICvsxZRf9EKTAJ6nmb7xRvUAglwf5N7Gz0YAa+9Cp2OlvDl3uWU9K5bt/vloSGDv4Zp0Doic
 d/hU7UEQKIrQQWuZW8JsgN9wmlsV59iG6BBTMGQDjJi5CXDwY7fV+CO2h1TPNbgmqf+dUcH1Yps
 8G2PJYANkZWfGXVAxWrfTdyvaNh4rr8Ub0URq1HVrnaAj0LvTwckFrVRs5DEwd0/dqomyganKSz
 z7AQo42ygq9Gwqp77xM2jKtZlC0sdxctDZ55BGZ/emFAt4zPa6i0wfU/k0yk=
X-Received: by 2002:a05:622a:5593:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-52e422cdf9fmr165432141cf.17.1787837586225; Thu, 27 Aug 2026
 06:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-wg-tstamp-v1-1-4acfebb855ef@well-founded.dev>
 <87a4q74rrg.fsf@toke.dk>
In-Reply-To: <87a4q74rrg.fsf@toke.dk>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 15:32:52 +0200
X-Gm-Features: AcwNN1UFHwjzPa1MzfktU0Iree-PWZZeotNBaKEOr_oEpX7vLWfiqFmBagJlnXY
Message-ID: <CANn89i+-SigypyE=66gnwxgz3-T7mBkWb1+UNDQCYOuFPmN2Ng@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: queueing: preserve tstamp_type in
 wg_reset_packet()
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@kernel.org>
Cc: Ramses de Norre via B4 Relay <devnull+ramses.well-founded.dev@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Martin KaFai Lau <kafai@fb.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramses de Norre <ramses@well-founded.dev>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Aug 27, 2026 at 3:28=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@kernel.org> wrote:
>
> Ramses de Norre via B4 Relay
> <devnull+ramses.well-founded.dev@kernel.org> writes:
>
> > From: Ramses de Norre <ramses@well-founded.dev>
> >
> > Sending traffic through a wireguard tunnel on a host using the fq
> > qdisc fills the log with:
> >
> >   fq: likely mono tstamp with tstamp_type 0
> >
> > An skb carries a timestamp in skb->tstamp and, separately, a
> > skb->tstamp_type field recording which clock that timestamp came from.
> > The two have to agree.
> >
> > When wireguard encapsulates a packet it calls wg_reset_packet(), which
> > clears the fields that must not leak from the inner packet into the
> > tunnel packet. It does so in two steps:
> >
> >   skb_scrub_packet(skb, true);
> >   memset(&skb->headers, 0, sizeof(skb->headers));
> >
> > skb_scrub_packet() deliberately keeps skb->tstamp when it holds a
> > monotonic timestamp: that value is the time the packet is scheduled to
> > be sent, and the qdisc still needs it. The memset then zeroes
> > skb->tstamp_type, because that field sits inside the headers group
> > while skb->tstamp does not. The packet therefore leaves wireguard
> > carrying a monotonic timestamp labelled as a realtime one.
> >
> > Nothing noticed until commit c4f796c4f16b ("net_sched: sch_fq: convert
> > skb->tstamp if not monotonic"): fq used to assume every timestamp was
> > monotonic. It now consults tstamp_type, spots the mismatch, warns, and
> > falls back to treating the value as monotonic. Pacing still ends up
> > correct, so the log spam is the actual problem.
> >
> > Save tstamp_type before the memset and restore it when encapsulating,
> > next to the hash fields that are already carried over this way. When
> > decapsulating it stays zeroed, which is right: an incoming packet's
> > timestamp is a realtime receive timestamp.
> >
> > Fixes: de799101519a ("net: Add skb_clear_tstamp() to keep the mono deli=
very_time")
> > Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
>
> Seems reasonable:
>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
