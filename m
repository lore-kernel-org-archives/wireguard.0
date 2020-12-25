Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E38C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 23:38:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DAB5207DE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 23:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DAB5207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5dc3b56;
	Fri, 25 Dec 2020 23:28:24 +0000 (UTC)
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com
 [205.220.184.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 673157ad
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 23:28:22 +0000 (UTC)
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
 by mx07-0057a101.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BPNbrJl013401; Sat, 26 Dec 2020 00:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=12052020;
 bh=xpSw/igH+4iyEPqACcXuj5VOZ9Q2g3w+dblQHbo6Ejc=;
 b=LSCtacs52mQb/+g+vudaolqU9voP4j607Mzdi+nkWMe9SyX/EXkGJI6zTWXsoBXX+1+I
 Sqm1WwnfmG6zzc5uCB7zCKPuQW00vKvips8uOnZxGcDmdPsm+GDQ+Njns9AK0KlZLqGm
 1rgD79rFSe04GbATF5fIYTNjAZmt05Erp9jJ6ss5stigC0p5U9qD7YoQhZH/NQ7e3rvm
 5SlPDzanu57Kl2K5a8NKGPj+Nge65S6HyIrotAOyn/97C3wQg6+/zrpaDwo07lp61xzu
 HZ+Sa0NdQbwt34jZjv/VwP3YqCYuJALGQQUJDWY9wgX/XLScHUNad1rj9Pxmg7tl+vWr 5g== 
Received: from mail.beijerelectronics.com ([195.67.87.132])
 by mx07-0057a101.pphosted.com with ESMTP id 35k0e037e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sat, 26 Dec 2020 00:37:53 +0100
Received: from wsests-s0004.westermo.com (192.168.10.12) by
 EX02GLOBAL.beijerelectronics.com (10.101.10.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1847.3; Sat, 26 Dec 2020 00:37:51 +0100
Received: from [172.29.80.30] (172.29.100.2) by wsests-s0004.westermo.com
 (192.168.10.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1847.3; Sat, 26
 Dec 2020 00:37:50 +0100
Subject: Re: How to verify a wireguard public key?
To: Nico Schottelius <nico.schottelius@ungleich.ch>, Adam Stiles
 <ajstiles@gmail.com>
CC: <wireguard@lists.zx2c4.com>
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
 <87h7oa5k0f.fsf@ungleich.ch>
From: Matthias May <matthias.may@westermo.com>
Message-ID: <85fdc2c4-e9de-e5fd-bd2c-fcae80ec0211@westermo.com>
Date: Sat, 26 Dec 2020 00:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87h7oa5k0f.fsf@ungleich.ch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.29.100.2]
X-ClientProxiedBy: wsevst-s0023.westermo.com (192.168.130.120) To
 wsests-s0004.westermo.com (192.168.10.12)
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

On 25/12/2020 10:10, Nico Schottelius wrote:
> 
> Good morning Adam and Jason,
> 
> thanks for your qualified and fast answers! It's nice to see Dan's
> website still referenced in almost 2021 and also that it can be easily
> enough verified.
> 
> For reference and if anyone ever looks up this thread, I am using
> the following code within the Django Rest Framework [0]:
> 
> --------------------------------------------------------------------------------
>     def validate_wireguard_public_key(self, value):
>         msg = _("Supplied key is not a valid wireguard public key")
> 
>         """
>         Verify wireguard key.
>         See https://urldefense.com/v3/__https://lists.zx2c4.com/pipermail/wireguard/2020-December/006221.html__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNgCByOzQ$ 
>         """
> 
>         try:
>             decoded_key = base64.standard_b64decode(value)
>         except Exception as e:
>             raise serializers.ValidationError(msg)
> 
>         if not len(decoded_key) == 32:
>             raise serializers.ValidationError(msg)
> 
>         return value
> --------------------------------------------------------------------------------
> 
> Thanks again and enjoy the quite time over Christmas!
> 
> Best regards,
> 
> Nico
> 
> [0] https://urldefense.com/v3/__https://code.ungleich.ch/uncloud/uncloud/-/blob/master/uncloud_net/serializers.py*L37__;Iw!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNb-aKgNg$ 
> 
> 
> Adam Stiles <ajstiles@gmail.com> writes:
> 
>> Hi Nico,
>>
>> WireGuard uses Curve25519 keys. A Curve25519 secret key is a random 32
>> byte value with a few special bits flipped, and a public key is
>> calculated from a secret key.
>>
>> There's some good info here (https://urldefense.com/v3/__https://cr.yp.to/ecdh.html__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNDoxdskk$ ), including
>> this questions and answer:
>>
>> "How do I validate Curve25519 public keys?"
>>
>> "Don't. The Curve25519 function was carefully designed to allow all
>> 32-byte strings as Diffie-Hellman public keys."
>>
>> I just saw Jason's response, and so this is a bit redundant, but the
>> reference above is a good one.
>>
>> Best,
>>
>> Adam
>>
>>
>> On Thu, Dec 24, 2020 at 3:21 PM Nico Schottelius
>> <nico.schottelius@ungleich.ch> wrote:
>>>
>>>
>>> Good morning,
>>>
>>> I am currently extending uncloud [0] to support wireguard tunnels and
>>> keys. At the moment it is not entirely clear how to verify that a
>>> certain string is a valid wireguard key.
>>>
>>> I first tried checking that it is valid base64, but not all base64
>>> strings are valid wireguard keys.
>>>
>>> Then I tried using `echo $key | wg pubkey && echo ok` - which seems to
>>> check the key format, however the intended behaviour here is misused.
>>>
>>> Does anyone have a pointer on how to reliably identify wireguard public
>>> keys?
>>>
>>> Is the wireguard key always 32 bytes when decoded from base64? Tests
>>> with a number of public keys seems to indicate that.
>>>
>>> Best regards,
>>>
>>> Nico
>>>
>>>
>>> [0] https://urldefense.com/v3/__https://code.ungleich.ch/uncloud/uncloud__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNE6JpRjQ$ 
>>>
>>> --
>>> Modern, affordable, Swiss Virtual Machines. Visit https://urldefense.com/v3/__http://www.datacenterlight.ch__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNmbUvisY$ 
> 
> 
> --
> Modern, affordable, Swiss Virtual Machines. Visit https://urldefense.com/v3/__http://www.datacenterlight.ch__;!!I9LPvj3b!XDmxiY_v3yY5wQI9GfFvshrCIUcqg4vvKg35qvL0fFajgNHTwr3LcySSqHrNmbUvisY$ 
> 


Hi
On this topic, i recently implemented a check if a key is valid in cpp with the following rather crude code:

bool isValidWgKey(const string& usage, const string& key)
{
	/* Wireguard keys are BASE64 encoded */
	unsigned int _key_length = 44;
	unsigned int _key_offset = _key_length -1;
	if (key.length() != _key_length) {
		log("Wireguard " + usage + " has wrong length (" + to_string(key.length()) + " instead of 44)!");
		return false;
	}
	size_t found = key.substr(0,_key_offset).find_first_not_of("abcdefghijklmnopqrstuvwxyz"
								   "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/");
	if (found != std::string::npos) {
		log("Wireguard " + usage + " contains invalid character '" + key.substr(found, 1) + "'");
		return false;
	}
	if (key.substr(_key_offset,1) != "=") {
		log("Wireguard " + usage + " ends with invalid character '" +
		    key.substr(found, 1) + "' instead of '='");
		return false;
	}
	return true;
}

Maybe it's useful to someone.

BR
Matthias
