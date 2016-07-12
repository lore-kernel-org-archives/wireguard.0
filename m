Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8777cd77
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 20:20:06 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
Date: Tue, 12 Jul 2016 22:20:50 +0200
Message-ID: <87bn22sj4t.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue 2016-07-12 19:55:50 +0200, Jason A. Donenfeld wrote:
> Endpoint is a good name.
> AllowedIPs is a horrible name. But I'm not sure what else to call it.
> I'm open to all suggestions.

AllowedTunnelledIPs ?
TunnelledCIDRs ?

               --dkg
