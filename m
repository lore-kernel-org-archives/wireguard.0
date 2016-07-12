Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7e26af0
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 17:45:39 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 Quan Zhou <quanzhou822@gmail.com>
In-Reply-To: <20160712155857.GA1368@lud.polynome.dn42>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
Date: Tue, 12 Jul 2016 19:46:26 +0200
Message-ID: <87vb0asqa5.fsf@alice.fifthhorseman.net>
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

On Tue 2016-07-12 17:58:58 +0200, Baptiste Jonglez wrote:
> On Tue, Jul 12, 2016 at 11:42:28PM +0800, Quan Zhou wrote:
>> I'm trying to connect to [2600:3c01:..:1487]:41414 from [2400:6180:...:1]
>> 
>> I have added the specific IPv6 /128 address to the AllowedIPs on one side,
>> and
>> on the other side I simply put ::0/0.
>> 
>> The address I've set was:
>> 
>> srv1 # ip addr add 10.240.51.2/24 dev wg0
>> srv2 # ip addr add 10.240.65.2/24 dev wg0
>
> I think you are confusing IP addresses used on the public Internet and IP
> addresses used "inside" the wireguard VPN.  AllowedIPs refers to IP
> addresses *inside* the VPN.

This isn't the first confusion of this type with wireguard.  It too me a
while to figure out and understand the distinction myself.  This
suggests that the documentation could be improved or (maybe and?) that
the choice of configuration names might be suboptimal.

While we're still in the experimental stages is a good time to propose
improvements in naming.  Is there a better name to give either Endpoint
or AllowedIPs (or both)?

   --dkg
