Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B6BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 23:47:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4678420829
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 23:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4678420829
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf3f9df2;
	Fri, 25 Dec 2020 23:37:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3022f8a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 23:37:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98cdf7f3
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nmpvnCcuKV1eFQ82W9BdScTqWtM=; b=zG7ZvN
 mKw1w5CHHMvjOqE7paZEIITZyc4R206dLGvFGDql4wTkPEmTXOMYCPE28eoUIcch
 0LH73KecB1DAtMOeS4oP4z8hb5ZepYqkNU63QUU1HOEShflwvcIJelQ6JoFM9N6h
 6wFAy9SaUQ3PH0wLStHeBzHxqCVntEuzvVeNGJznQkzs+JuYoYXaOA2Elu5pSTVW
 gqUiSILpyqzWPtI7h4K6A6YVLl9M4KxLKLsdni/TQCEt4UxkNPnr4u5dWzgoRJKC
 AtY2JOO4bc+lJRYaK+PA3QBaKwhT/CrOLOtEHASB9FZAI9Bq0bgEedMvy6N6nS5c
 npUOo9g6G7a4jWkQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b38f3ba1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 23:38:29 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id x2so5027577ybt.11
 for <wireguard@lists.zx2c4.com>; Fri, 25 Dec 2020 15:47:20 -0800 (PST)
X-Gm-Message-State: AOAM531WzszhFsG0CG/1e3PiBHKkWiD4r57lKiOcK7l5RdSVRDyLkHOt
 Mfilrg3zrZqKbc29g94htSiVTjW0Zm5rt5/5Y+U=
X-Google-Smtp-Source: ABdhPJyo6zU3P/QYSn+VNJdluZg1nRZkbHMA8WlBuT40O7SneoDPFJ/1Ih5Kx1HPgx21RPhSUmbjmjEq2+Be7f4bvmU=
X-Received: by 2002:a25:bb81:: with SMTP id y1mr51768309ybg.456.1608940039528; 
 Fri, 25 Dec 2020 15:47:19 -0800 (PST)
MIME-Version: 1.0
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
 <87h7oa5k0f.fsf@ungleich.ch>
 <85fdc2c4-e9de-e5fd-bd2c-fcae80ec0211@westermo.com>
In-Reply-To: <85fdc2c4-e9de-e5fd-bd2c-fcae80ec0211@westermo.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 26 Dec 2020 00:47:08 +0100
X-Gmail-Original-Message-ID: <CAHmME9rqQ1o607SNys4vEnj=nhNEE4ssHDy+c=pV8Sr6nAnrRA@mail.gmail.com>
Message-ID: <CAHmME9rqQ1o607SNys4vEnj=nhNEE4ssHDy+c=pV8Sr6nAnrRA@mail.gmail.com>
Subject: Re: How to verify a wireguard public key?
To: Matthias May <matthias.may@westermo.com>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 Adam Stiles <ajstiles@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Dec 26, 2020 at 12:38 AM Matthias May <matthias.may@westermo.com> wrote:
>
> On 25/12/2020 10:10, Nico Schottelius wrote:
> >
> > Good morning Adam and Jason,
> >
> > thanks for your qualified and fast answers! It's nice to see Dan's
> > website still referenced in almost 2021 and also that it can be easily
> > enough verified.
> >
> > For reference and if anyone ever looks up this thread, I am using
> > the following code within the Django Rest Framework [0]:
> >
> > --------------------------------------------------------------------------------
> >     def validate_wireguard_public_key(self, value):
> >         msg = _("Supplied key is not a valid wireguard public key")
> >
> >         """
> >         Verify wireguard key.
> >         See https://urldefense.com/v3/__https://lists.zx2c4.com/pipermail/wireguard/2020-December/006221.html__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNgCByOzQ$
> >         """
> >
> >         try:
> >             decoded_key = base64.standard_b64decode(value)
> >         except Exception as e:
> >             raise serializers.ValidationError(msg)
> >
> >         if not len(decoded_key) == 32:
> >             raise serializers.ValidationError(msg)
> >
> >         return value
> > --------------------------------------------------------------------------------
> >
> > Thanks again and enjoy the quite time over Christmas!
> >
> > Best regards,
> >
> > Nico
> >
> > [0] https://urldefense.com/v3/__https://code.ungleich.ch/uncloud/uncloud/-/blob/master/uncloud_net/serializers.py*L37__;Iw!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNb-aKgNg$
> >
> >
> > Adam Stiles <ajstiles@gmail.com> writes:
> >
> >> Hi Nico,
> >>
> >> WireGuard uses Curve25519 keys. A Curve25519 secret key is a random 32
> >> byte value with a few special bits flipped, and a public key is
> >> calculated from a secret key.
> >>
> >> There's some good info here (https://urldefense.com/v3/__https://cr.yp.to/ecdh.html__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNDoxdskk$ ), including
> >> this questions and answer:
> >>
> >> "How do I validate Curve25519 public keys?"
> >>
> >> "Don't. The Curve25519 function was carefully designed to allow all
> >> 32-byte strings as Diffie-Hellman public keys."
> >>
> >> I just saw Jason's response, and so this is a bit redundant, but the
> >> reference above is a good one.
> >>
> >> Best,
> >>
> >> Adam
> >>
> >>
> >> On Thu, Dec 24, 2020 at 3:21 PM Nico Schottelius
> >> <nico.schottelius@ungleich.ch> wrote:
> >>>
> >>>
> >>> Good morning,
> >>>
> >>> I am currently extending uncloud [0] to support wireguard tunnels and
> >>> keys. At the moment it is not entirely clear how to verify that a
> >>> certain string is a valid wireguard key.
> >>>
> >>> I first tried checking that it is valid base64, but not all base64
> >>> strings are valid wireguard keys.
> >>>
> >>> Then I tried using `echo $key | wg pubkey && echo ok` - which seems to
> >>> check the key format, however the intended behaviour here is misused.
> >>>
> >>> Does anyone have a pointer on how to reliably identify wireguard public
> >>> keys?
> >>>
> >>> Is the wireguard key always 32 bytes when decoded from base64? Tests
> >>> with a number of public keys seems to indicate that.
> >>>
> >>> Best regards,
> >>>
> >>> Nico
> >>>
> >>>
> >>> [0] https://urldefense.com/v3/__https://code.ungleich.ch/uncloud/uncloud__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNE6JpRjQ$
> >>>
> >>> --
> >>> Modern, affordable, Swiss Virtual Machines. Visit https://urldefense.com/v3/__http://www.datacenterlight.ch__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNmbUvisY$
> >
> >
> > --
> > Modern, affordable, Swiss Virtual Machines. Visit https://urldefense.com/v3/__http://www.datacenterlight.ch__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNmbUvisY$
> >
>
>
> Hi
> On this topic, i recently implemented a check if a key is valid in cpp with the following rather crude code:
>
> bool isValidWgKey(const string& usage, const string& key)
> {
>         /* Wireguard keys are BASE64 encoded */
>         unsigned int _key_length = 44;
>         unsigned int _key_offset = _key_length -1;
>         if (key.length() != _key_length) {
>                 log("Wireguard " + usage + " has wrong length (" + to_string(key.length()) + " instead of 44)!");
>                 return false;
>         }
>         size_t found = key.substr(0,_key_offset).find_first_not_of("abcdefghijklmnopqrstuvwxyz"
>                                                                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/");
>         if (found != std::string::npos) {
>                 log("Wireguard " + usage + " contains invalid character '" + key.substr(found, 1) + "'");
>                 return false;
>         }
>         if (key.substr(_key_offset,1) != "=") {
>                 log("Wireguard " + usage + " ends with invalid character '" +
>                     key.substr(found, 1) + "' instead of '='");
>                 return false;
>         }
>         return true;
> }

This code is incorrect because it allows keys that are up to 258bits,
instead of being exactly 256bits. See my post a few messages ago about
different rules for the penultimate character.

https://lists.zx2c4.com/pipermail/wireguard/2020-December/006222.html

Jason
