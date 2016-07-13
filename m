Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f0f505e
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:51:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccfb5554
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:51:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 90c6ecbc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:51:46 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id h129so45035030lfh.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 10:52:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8737ndo2t2.fsf@alice.fifthhorseman.net>
References: <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
 <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
 <20160713165745.GB25457@lud.polynome.dn42>
 <8737ndo2t2.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2016 19:52:41 +0200
Message-ID: <CAHmME9q2RPmjmJQLAgLRtaXEt3Wot57aC+Mw6Kn2xk0q-6pGAg@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> On Wed 2016-07-13 18:57:45 +0200, Baptiste Jonglez wrote:
>> Actually, it does !  This dual usage brings more confusion.  Despite the
>> name, "AllowedIPs" controls both:
>>
>> 1) packets that are *received* from a peer (by looking at the source IP
>>    address after decrypting an incoming packet, and only allowing the
>>    packet if it matches an AllowedIPs rule for this peer)
>>
>> 2) packets that are *sent* through a wireguard interface, where the right
>>    peer is found by looking for a matching AllowedIPs entry (using the
>>    destination IP address of the packet, this time).  That's the
>>    "cryptokey routing" part.
>

Baptiste is exactly right here. It's a routing table on the way out
and an ACL on the way in.
Now, theoretically, these don't actually have to be the same list.
About a year ago I was experimenting with keeping these separate, but
opted to keep them the same because... which leads me to Daniel's
remark.


On Wed, Jul 13, 2016 at 7:39 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> so if a given interface has two peers, their AllowedIPs (or whatever we
> end up calling it) are not permitted to overlap?  That constraint should
> probably be better documented as well.  It makes sense now that you
> describe it, but it wasn't obvious from the current docs.

If the AllowedIPs overlap, on the way out, it functions in the exact
same way as a routing table: the most specific route is the one that's
chosen.
On the way in, for checking the ACL, the way it works is NOT by (A)
checking to see if that peer has an AllowedIPs that matches the
incoming packet's src. RATHER, (B) it consults the entire cryptokey
routing table, globally, to see to whom this packet would be routed on
the way out, and if that peer matches the receiving peer, then it's
allowed. By making AllowedIPs cover both, we get this nice property of
(B). Namely, with (B) we have a stronger variant of reverse-path
filtering that ties packets to keys. (B) then enables userspace to be
completely sure that the peer they're talking to is necessarily the
one single peer who has a particular public key and specific
AllowedIPs entry. The stronger crypto reverse-path filtering (B) is
actually something that mitigates real vulnerabilities with certain
misconfgured IPsec boxes I've owned (as part of my day job) in the
wild.

You're right -- I should document this. There's a lot of thought that
went into all these little components, and at the time of
documentation-writing, it was hard to enumerate what they all were.
It's good that things are surfacing organically now.
