Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A8CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9718220825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9718220825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hwipl.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2344b01d;
	Mon, 13 Jul 2020 23:31:22 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d914d72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jul 2020 12:00:03 +0000 (UTC)
Received: from kiste ([79.246.96.6]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MVdUQ-1jP08r04Dk-00Raj1; Wed, 01
 Jul 2020 14:19:53 +0200
Date: Wed, 1 Jul 2020 14:19:49 +0200
From: Hans Wippel <ndev@hwipl.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Hans Wippel
 <ndev@hwipl.net>, WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>
Subject: Re: wireguard: problem sending via libpcap's packet socket
Message-Id: <20200701141949.b9ed27c6547a2db29a5977d8@hwipl.net>
In-Reply-To: <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
 <CAHmME9pX30q1oWY3hpjK4u-1ApQP7RCA07BmhtRQx=dR85MS9A@mail.gmail.com>
 <CAHmME9oCHNSNAVTNtxO2Oz10iqj_D8JPmN8526FbQ8UoO0-iHw@mail.gmail.com>
 <CA+FuTSdpU_2w9iU+Rtv8pUepOcwqHYaV1jYVfB6_K157E6CSZw@mail.gmail.com>
 <CAHmME9rZieNAYeeK90HLoaoeKJEv5vE9MHfn-q5zFY8_ebNqxw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:sXYTEldYeq9B8wzQpk97273kxAkcaDamhW4TOkP0MEyzCY6IAHc
 SNs4X0YboLjyBJzQn7IJcKo0ruiyu5UOrLZd8bltPnH46xy/I0NnTMpN0cZBDjHXk/7wTAu
 T2jH1rfRJEnfdvOBTLz7bjhbejCJ3cZu9CNNJ0QuHa+s8IUxI+Wg6PgxNmm3qOo2+ziHaWm
 rQj6TiWbX/oWcIQg0f9/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+aeDD0wKsLw=:W1DWRRQN9z6dBBM8AzGXtW
 pLlQVx5FypOByAizqlNtr5E0CNusuD9sOF/c7+wLIsKzMQJQC6r3OOdEjKigF4cYm+1jNDHqQ
 JmB/HbXKKNYXUf5GsiAyUfG0Aecbx0G69Mw09yCTx/dGJPuzSyReIaHvEymT+qB1qkCHXCNWz
 t0sANLNUaCeYFcwvcyGPr8xg7Fvr5nIvE+7E5fhY+PgZiKRAxWky0CnLutmzq4Ju7VxreeQmx
 N1RuL6XiT8Gu7WbBUCuaSKfHydA0XBD4J7uNA5Fj9aeHa9T6PAqTDXkBPrf9Q67ILK1EXtDGW
 TIhN349yUTmtvQ0RXMLRs3xCh7NuARNJs7raxBrsR31WEVtVByCQey4eoCSicFejGpQpJIVWU
 2C1esKsVAaa5cfNi+5+8M0SsSh/QKPAUK6+2KWJ6GL2I29Fi/IVhs/A6X2+ONE+4JbewPijxC
 cDCBLdK1YFM8IIvK1BZ2WNWneRvuY/ro6tJkFWirSUcIxeYpIM3hDz5nP4I1adcVQVnoiMLli
 5jstJ8nHWKJN+huC1kvaz1AMCYBNRsQq5imV4klqNlWdFV8SPgEj7mRdkcmxy7EPy4ox33Hj1
 +sAJG//ZTqrJi/xBUwn00Mg1ThjJEwFpkuhTnBfjhvCOq5UuPnccKS4bRx0wtszstSD/wF4C1
 AGiSy1Eo/sB0r6p8EDBKgP7g6QQ/tYsub5ltx0Gy7+3sHqNbM0OJ9xzuIMosEsk4OIlqOmBVp
 fyPHsLar9scBcfKDWJ+sRzZ8MimTlrYOOnGJODF/qi4S1vxUQkzYO4HS6DS/0PXsi3LyjqLj/
 I7QXzd0rPYlM68s+i7EnvTI8UTgeVwpHVU2Ke6NMq2+24Efj+UpCDTEhF9EXChNZdCMqaiV
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:31:20 +0200
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

On Tue, 30 Jun 2020 21:05:27 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Sun, Jun 28, 2020 at 2:04 PM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > On Sat, Jun 27, 2020 at 1:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hi again Hans,
> > >
> > > A few remarks: although gre implements header_ops, it looks like
> > > various parts of the networking stack change behavior based on it. I'm
> > > still analyzing that to understand the extent of the effects.
> > > Something like <https://git.zx2c4.com/wireguard-linux/commit/?id=40c24fd379edc1668087111506ed3d0928052fe0>
> > > would work, but I'm not thrilled by it. Further research is needed.
> > >
> > > However, one thing I noticed is that other layer 3 tunnels don't seem
> > > to be a fan of libpcap. For example, try injecting a packet into an
> > > ipip interface. You'll hit exactly the same snag for skb->protocol==0.
> >
> > Not setting skb protocol when sending over packet sockets causes many
> > headaches. Besides packet_parse_headers, virtio_net_hdr_to_skb also
> > tries to infer it.
> >
> > Packet sockets give various options to configure it explicitly: by
> > choosing that protocol in socket(), bind() or, preferably, by passing
> > it as argument to sendmsg. The socket/bind argument also configures
> > the filter to receive packets, so for send-only sockets it is
> > especially useful to choose ETH_P_NONE (0) there. This is not an
> > "incorrect" option.
> >
> > Libpcap does have a pcap_set_protocol function, but it is fairly
> > recent, so few processes will likely be using it. And again it is
> > still not ideal if a socket is opened only for transmit.
> >
> > header_ops looks like the best approach to me, too. The protocol field
> > needs to reflect the protocol of the *outer* packet, of course, but if
> > I read wg_allowedips_lookup_dst correctly, wireguard maintains the
> > same outer protocol as the inner protocol, no sit (6-in-4) and such.
> 
> WireGuard does allow 6-in-4 and 4-in-6 actually. But parse_protocol is
> only ever called on the inner packet. The only code paths leading to
> it are af_packet-->ndo_start_xmit, and ndo_start_xmit examines
> skb->protocol of that inner packet, which means it entirely concerns
> the inner packet. And generally, for wireguard, userspace only ever
> deals with the inner packet. That inner packet then gets encrypted and
> poked at in strange ways, and then the encrypted blob of sludge gets
> put into a udp packet and sent some place. So I'm quite sure that the
> behavior just committed is right.
> 
> And from writing a few libpcap examples, things seem to be working
> very well, including Hans' example.
> 
> Hans - if you want to try out davem's net.git tree, you can see if
> this is working properly for you.

I just tested it and everything seems to work now. Thanks :)
  Hans
