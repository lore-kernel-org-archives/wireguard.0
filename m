Return-Path: <SRS0=XOuh=6M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FAFC83000
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 18:52:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D33E020575
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 18:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZp8na6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D33E020575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2e7f8ad;
	Tue, 28 Apr 2020 18:40:48 +0000 (UTC)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [2607:f8b0:4864:20::d41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8aab95e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 18:40:45 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id o127so24402151iof.0
 for <wireguard@lists.zx2c4.com>; Tue, 28 Apr 2020 11:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YcolCA5UGsYd8MO7lKIdAOUu80aS6WVfbJK7dKN2m8E=;
 b=IZp8na6n/r3Oqsj+jER/mQ/xuY7Tp9L5AKTFZsSkvPJlr4ymLDOlWybi3dh28GOYOa
 QyT/tLODYquhyyzEVOMkPRk2EZszGgRSp2qn/ebBhKaDkwyd3sb+mS4h50PJOhv2oUXR
 W67wmpRsUm4jgldD5X39hLgsWHWNFP8zgpMlZDfiMH07dVzZD6NMUW93Opl706ZldOvE
 nHRkNCmidf9R91MZ+xAmUmo9FNvWyJKlg8pTeh9rnc3dxLrzrxUcqmbeUKt1+vXXo219
 05eW+qWpAKY1wu47erhel53qE3z9adaIV7ECBM0UN2U7Mx2jn8pQ31TUWgqcT/FJ+TqT
 jLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YcolCA5UGsYd8MO7lKIdAOUu80aS6WVfbJK7dKN2m8E=;
 b=EImlWlK1prasLnpol+ZtjQCqXEwErT4gmT1v+zICiii2cusG9KYIoR9AUCsiy81jBn
 VVYJuJsLhJP71uyPaE1481ESf5dA4ZFTiV9rnrHNfc3U+DCXkrTQH11lnVhDn86o5lbb
 WfejgOfsff+MIViLCwgJNYZsNvhWU3wPkmsR3uGOoTsGxdHZjYJ4UL0Rw8gsxkOhxlwB
 c24r//ji8KLJ54c3+4ax+oWsPA+Qp3H1JxJifnp9ysMtOatf6xlseLGP/5uJv/x7NbS3
 CoFLP/680y0jELqnfw/CF7XmOtLxnsds1EEAFJIhJOUwhP6HoLowAdxrFRPwAI6Ze0f6
 6kWA==
X-Gm-Message-State: AGi0Pub70cJv9oP6FjZfo1Cwui3b7jHtbTy4DJVb57UBJ3QRks56Bm6f
 GrPz3gxNWPLePpfhdIATzauvmB2BujRht0EfQuU=
X-Google-Smtp-Source: APiQypLc8aP0uRejii9qw2EagnHuGCj/cbUVwj8w8sugKxx9Jp3UJ+ZUigGcmdcg0k0CAfVSEBrjYbuOgcuGzAX+4WI=
X-Received: by 2002:a02:a90e:: with SMTP id n14mr26109946jam.97.1588099944699; 
 Tue, 28 Apr 2020 11:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <202004280109.03S19SCY001751@gndrsh.dnsmgr.net>
 <87zhawvuuk.fsf@toke.dk>
In-Reply-To: <87zhawvuuk.fsf@toke.dk>
From: Dave Taht <dave.taht@gmail.com>
Date: Tue, 28 Apr 2020 11:52:13 -0700
Message-ID: <CAA93jw7-yiy=ic71DWG4XHLU5eCGb1p-6bKVX7NQFmTOu+jpLQ@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: Use tunnel helpers for decapsulating ECN
 markings
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>,
 Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>, 
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
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

On Tue, Apr 28, 2020 at 2:10 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> "Rodney W. Grimes" <ietf@gndrsh.dnsmgr.net> writes:
>
> > Replying to a single issue I am reading, and really hope I
> > am miss understanding.  I am neither a wireguard or linux
> > user so I may be miss understanding what is said.
> >
> > Inline at {RWG}
> >
> >> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> >>
> >> > Hey Toke,
> >> >
> >> > Thanks for fixing this. I wasn't aware there was a newer ECN RFC. A
> >> > few comments below:
> >> >
> >> > On Mon, Apr 27, 2020 at 8:47 AM Toke H?iland-J?rgensen <toke@redhat.=
com> wrote:
> >> >> RFC6040 also recommends dropping packets on certain combinations of
> >> >> erroneous code points on the inner and outer packet headers which s=
houldn't
> >> >> appear in normal operation. The helper signals this by a return val=
ue > 1,
> >> >> so also add a handler for this case.
> >> >
> >> > This worries me. In the old implementation, we propagate some outer
> >> > header data to the inner header, which is technically an authenticit=
y
> >> > violation, but minor enough that we let it slide. This patch here
> >> > seems to make that violation a bit worse: namely, we're now changing
> >> > the behavior based on a combination of outer header + inner header. =
An
> >> > attacker can manipulate the outer header (set it to CE) in order to
> >> > learn whether the inner header was CE or not, based on whether or no=
t
> >> > the packet gets dropped, which is often observable. That's some form
> >
> > Why is anyone dropping on decap over the CE bit?  It should be passed
> > on, not lead to a packet drop.  If the outer header is CE on an inner
> > header of CE it should just continue to be a CE, dropping it is actuall=
y
> > breaking the purpose of the CE codepoint, to signal congestion before
> > having to cause a packet loss.
> >
> >> > of an oracle, which I'm not too keen on having in wireguard. On the
> >> > other hand, we pretty much already _explicitly leak this bit_ on tx
> >> > side -- in send.c:
> >> >
> >> > PACKET_CB(skb)->ds =3D ip_tunnel_ecn_encap(0, ip_hdr(skb), skb); // =
inner packet
> >> > ...
> >> > wg_socket_send_skb_to_peer(peer, skb, PACKET_CB(skb)->ds); // outer =
packet
> >> >
> >> > We considered that leak a-okay. But a decryption oracle seems slight=
ly
> >> > worse than an explicit and intentional leak. But maybe not that much
> >> > worse.
> >>
> >> Well, seeing as those two bits on the outer header are already copied
> >> from the inner header, there's no additional leak added by this change=
,
> >> is there? An in-path observer could set CE and observe that the packet
> >> gets dropped, but all they would learn is that the bits were zero
> >
> > Again why is CE leading to anyone dropping?
> >
> >> (non-ECT). Which they already knew because they could just read the bi=
ts
> >> directly from the header.
> >>
> >> Also note, BTW, that another difference between RFC 3168 and 6040 is t=
he
> >> propagation of ECT(1) from outer to inner header. That's not actually
> >> done correctly in Linux ATM, but I sent a separate patch to fix this[0=
],
> >> which Wireguard will also benefit from with this patch.

I note that there is a large ISP in argentina that has been
mis-marking most udp & tcp traffic
as CE for years now and despite many attempts to get 'em to fix it,
when last I checked (2? 3?)
months back, they still were doing it.

My impression of overall competence and veracity of multiple transit
and isp providers has been sorely
tried recently. While I support treating ect 1 and 2 properly, I am
inclined to start thinking that
ce on a non-ect encapsulated packet is something that should not be dropped=
.

but, whatever is decided on that front is in the hooks in the other
patch above, not in wireguard,
and I'll make the same comment there.



> >
> > Thanks for this.
> >
> >>
> >> > I wanted to check with you: is the analysis above correct? And can y=
ou
> >> > somehow imagine the =3D=3D2 case leading to different behavior, in w=
hich
> >> > the packet isn't dropped? Or would that ruin the "[de]congestion" pa=
rt
> >> > of ECN? I just want to make sure I understand the full picture befor=
e
> >> > moving in one direction or another.
> >>
> >> So I think the logic here is supposed to be that if there are CE marks
> >> on the outer header, then an AQM somewhere along the path has marked t=
he
> >> packet, which is supposed to be a congestion signal, which we want to
> >> propagate all the way to the receiver (who will then echo it back to t=
he
> >> receiver). However, if the inner packet is non-ECT then we can't
> >> actually propagate the ECN signal; and a drop is thus the only
> >> alternative congestion signal available to us.
> >
> > You cannot get a CE mark on the outer packet if the inner packet is
> > not ECT, as the outer packet would also be not ECT and thus not
> > eligible for CE mark.  If you get the above sited condition something
> > has gone *wrong*.
>
> Yup, you're quite right. If everything is working correctly, this should
> never happen. This being the internet, though, there are bound to be
> cases where it will go wrong :)
>
> >> This case shouldn't
> >> actually happen that often, a middlebox has to be misconfigured to
> >> CE-mark a non-ECT packet in the first place. But, well, misconfigured
> >> middleboxes do exist as you're no doubt aware :)
> >
> > That is true, though I believe the be liberal in what you accept
> > concept would say ok, someone messed up, just propogate it and
> > let the end nodes deal with it, otherwise your creating a blackhole
> > that could be very hard to find.
>
> But that would lead you to ignore a congestion signal. And someone has
> to go through an awful lot of trouble to set this signal; if they're
> just randomly mangling bits the packet checksum will likely be wrong and
> the packet would be dropped anyway. So on balance I'd tend to agree with
> the RFC that the right thing to do is to propagate the congestion
> signal; which in the case of a non-ECT packet means dropping it,
> otherwise we'd just be contributing to the RFC-violating behaviour...
>
> I do believe the advice in the RFC to log these cases is exactly because
> of the risk of blackholes you're referring to. I discussed this a bit
> with Jason and we ended up agreeing that just marking it as a framing
> error should be enough for Wireguard, though...
>
> -Toke
>


--=20
Make Music, Not War

Dave T=C3=A4ht
CTO, TekLibre, LLC
http://www.teklibre.com
Tel: 1-831-435-0729
