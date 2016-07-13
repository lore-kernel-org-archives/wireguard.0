Return-Path: alex_y_xu@yahoo.ca
Received: from nm32-vm1.bullet.mail.gq1.yahoo.com
 (nm32-vm1.bullet.mail.gq1.yahoo.com [98.136.216.224])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7647cda2
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 12:40:44 +0000 (UTC)
Date: Wed, 13 Jul 2016 08:36:33 -0400
From: Alex Xu <alex_y_xu@yahoo.ca>
To: wireguard@lists.zx2c4.com
Message-ID: <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
In-Reply-To: <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 13 Jul 2016 10:28:17 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> TunnelIPs ?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

I vote for ReceiveSubnets. I also support PeerSubnets. "CIDR" is also
not too complex because you must know what CIDR is to set the option
properly anyways.

IMO the use of the term "VPN" should be avoided to cases where an
actual private network is being used. Here, it is simply referring to
the subnets on the other side.

I also considered "RemoteSubnets", but that would seem to imply that
that also affects the subnets that are *sent* in the wg tunnel, which
AIUI is actually controlled by routing tables.

For the record as well, the SWAN family of IPsec implementations calls
a similar configuration option "rightsubnet", which is not terrible
but applies poorly in this case, since (AIUI) that one actually
configures the xfrm tables.
