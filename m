Return-Path: mmoya@mmoya.org
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
 [209.85.215.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fda47c1
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 07:18:21 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b199so31419187lfe.0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 00:19:15 -0700 (PDT)
Return-Path: <mmoya@mmoya.org>
Received: from [192.168.0.70] (51.red-83-56-19.staticip.rima-tde.net.
 [83.56.19.51])
 by smtp.googlemail.com with ESMTPSA id r196sm1811925lfd.41.2016.07.13.00.19.10
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jul 2016 00:19:11 -0700 (PDT)
To: wireguard@lists.zx2c4.com
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
From: Maykel Moya <mmoya@mmoya.org>
Message-ID: <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
Date: Wed, 13 Jul 2016 09:19:09 +0200
MIME-Version: 1.0
In-Reply-To: <87bn22sj4t.fsf@alice.fifthhorseman.net>
Content-Type: text/plain; charset=utf-8
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 12/07/16 22:20, Daniel Kahn Gillmor wrote:

Hi, all

First of all, I'd like to thank Jason for wireguard and those packagers
who are making wireguard more easy to install.

Easy and solid crypto for all is a good thing.

> On Tue 2016-07-12 19:55:50 +0200, JRason A. Donenfeld wrote:
>> Endpoint is a good name.
>> AllowedIPs is a horrible name. But I'm not sure what else to call it.
>> I'm open to all suggestions.
> 
> AllowedTunnelledIPs ?
> TunnelledCIDRs ?

Let's bikeshed.

I vote for 'AllowedTunnelledIPs' because:

* It's near to what we have now (AllowedIPs).
* It's simple (not technicisms in the name like 'vpn', 'cidr').
* It's reasonable concise (not like AllowedTunnelledSourceIPs or
AllowedIncomingSourceIPs or whatever).
* The name represents exactly what is under the hood. This value
represents those ips allowed to pop up from the wg iface and not
necessarily the subnets of the peer.

I don't subscribe Baptiste suggestions (VPNSubnets, PeerVPNSubnets,
InternalIPs) because considering the case when you're routing all ip4 or
ip6 through the tunnel, in the 'client' side you will have to allow
0.0.0.0/0 and ::/0 and those are neither internal ips nor subnets of the
peers.

mmoya
