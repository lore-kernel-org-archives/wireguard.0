Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67968050
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:38:26 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
In-Reply-To: <20160713165745.GB25457@lud.polynome.dn42>
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
Date: Wed, 13 Jul 2016 19:39:21 +0200
Message-ID: <8737ndo2t2.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2016-07-13 18:57:45 +0200, Baptiste Jonglez wrote:
> Actually, it does !  This dual usage brings more confusion.  Despite the
> name, "AllowedIPs" controls both:
>
> 1) packets that are *received* from a peer (by looking at the source IP
>    address after decrypting an incoming packet, and only allowing the
>    packet if it matches an AllowedIPs rule for this peer)
>
> 2) packets that are *sent* through a wireguard interface, where the right
>    peer is found by looking for a matching AllowedIPs entry (using the
>    destination IP address of the packet, this time).  That's the
>    "cryptokey routing" part.

so if a given interface has two peers, their AllowedIPs (or whatever we
end up calling it) are not permitted to overlap?  That constraint should
probably be better documented as well.  It makes sense now that you
describe it, but it wasn't obvious from the current docs.

         --dkg
