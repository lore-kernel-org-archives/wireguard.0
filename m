Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBBBC38A2D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Oct 2022 14:55:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7cc6a1fa;
	Mon, 24 Oct 2022 14:54:53 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 000ebe56
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2022 09:29:55 +0000 (UTC)
X-KPN-MessageId: 96d8756c-4f90-11ed-be70-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 96d8756c-4f90-11ed-be70-005056aba152;
 Wed, 19 Oct 2022 11:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=content-type:mime-version:message-id:subject:to:from:date;
 bh=Opp5AYLa+SjHU2LWMrTRRCelAfBhHYzhOJqDvQ5U7rg=;
 b=D/eAQaxNxiwobRQrrCUOwIiLMGd11imsvqo8zvlwZk+4vVLZO8XEJs5vNVNAJP0fhpkRLZpwOn5IM
 jjpWYQaV7ZXy8x6PpCKNB2NX8LtFvsmhn35JR9YSdhgLK3DSCvnF3hbSAbx+I0t7kK2RPHbfF42DQh
 Lt3YrvySb7E2cQKY=
X-KPN-MID: 33|HMdhk8ofe+mkhaYvbgo5T7XMGI6qm4jciT2GL3Yod88iLEE+wPoSDinuKrjQ/A3
 9pMP6KIbduUYCr5u7fM2jP5PYwualS1+vlzw3KMdo3CY=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|+GmuLgnDlJ+qkt2tOsNaICdhH5n3AbcuuUxnklBc79RgxvwO40fqc2Z2rmZVDMv
 uv4gZKaidOCezkznojFb+HA==
X-Originating-IP: 77.173.183.203
Received: from fame.vanrein.org (77-173-183-203.fixed.kpn.net [77.173.183.203])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 973c00aa-4f90-11ed-9ebb-005056ab7584;
 Wed, 19 Oct 2022 11:29:55 +0200 (CEST)
Received: by fame.vanrein.org (Postfix, from userid 1000)
 id D099A2A224; Wed, 19 Oct 2022 09:29:54 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:29:54 +0000
From: Rick van Rein <rick@openfortress.nl>
To: wireguard@lists.zx2c4.com
Subject: Wireguard setup with SIP
Message-ID: <20221019092954.GA22238@openfortress.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Mailman-Approved-At: Mon, 24 Oct 2022 14:54:43 +0000
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

Hello all,

I would like to tell you about some work I'm doing to allow
Wireguard sites to negotiate their setup over SIP.  This can
even be used to spontaneously setup VPNs with new parties, to
the level that their SIP server is open to such requests.

The standard session setup and teardown is used, INVITE and BYE.
Given the right SDP formulation, these can exchange the params
for the tunnel; this is what I am sending in the current version,

v=0
o=- 4124031101 285260646 IN IP6 2001:db8:666::666
s=-
c=IN IP6 2001:db8:666::666
t=0 0
m=application 57660 udp vnd.wireguard
a=fmtp:vnd.wireguard pubkey=YWl42m1t56sMAYKwGZUQZNuYG+AbdW9eE7KLj3KBT1M=;prefix=2001:db8:456:1::/64;pskmth=none
a=sendrecv

The traffic should be authenticated; for that I want to validate
the From: and To: SIP headers using SASL, possibly with mutual
authentication and possibly with key derivation (then set pskmth
to a suitable value).


I'm curious how you feel about this!



In the SDP fragment above, I mentioned application/vnd.wireguard
as a Media Type; these are best registered with IANA.  In this
application (and probably any other) this could represent the
message flow as it is encapsulated into UDP.

Would you agree on registering such a Media Type with IANA?
I don't care who does it, but it would be the proper course of
action.


Code, SIP achieves Wireguard setup within localhost:
https://gitlab.com/0cpm/subliminal/-/blob/master/src/wgsip.c

Man page:
https://gitlab.com/0cpm/subliminal/-/blob/master/doc/man/wgsip.1

SASL for SIP and HTTP:
https://www.ietf.org/archive/id/draft-vanrein-sipauth-sasl-01.html
https://www.ietf.org/archive/id/draft-vanrein-httpauth-sasl-07.html

Context:
The code arose as part of a project "Subliminal Messaging" that injects
digital data into a POTS/VoIP call mixture.  The idea is that phone
calls would be *one* possible method for Wireguard setup, but the same
idea would also work over


Thanks,
 -Rick


RFC 6838 says:

   The "application" top-level type is to be used for discrete data that
   do not fit under any of the other type names, and particularly for
   data to be processed by some type of application program.  This is
   information that must be processed by an application before it is
   viewable or usable by a user.

...

   The vendor tree is used for media types associated with publicly
   available products.  "Vendor" and "producer" are construed very
   broadly in this context and are considered equivalent.  Note that
   industry consortia as well as non-commercial entities that do not
   qualify as recognized standards-related organizations can quite
   appropriately register media types in the vendor tree.

...

   Vendor-tree registrations will be distinguished by the leading facet
   "vnd.".  That may be followed, at the discretion of the registrant,
   by either a media subtype name from a well-known producer (e.g.,
   "vnd.mudpie") or by an IANA-approved designation of the producer's
   name that is followed by a media type or product designation (e.g.,
   vnd.bigcompany.funnypictures).


   While public exposure and review of media types to be registered in
   the vendor tree are not required, using the media-types@iana.org
   mailing list for review is encouraged, to improve the quality of
   those specifications.  Registrations in the vendor tree may be
   submitted directly to the IANA, where they will undergo Expert Review
   [RFC5226] prior to approval.

