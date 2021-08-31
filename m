Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56CCC4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B1560F92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2B1560F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sys.casa
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 541346cc;
	Wed, 1 Sep 2021 13:44:27 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5debf54
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Aug 2021 17:41:46 +0000 (UTC)
Date: Tue, 31 Aug 2021 17:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sys.casa;
 s=protonmail; t=1630431704;
 bh=keDrlD2thMY8h+aQmQpFo0pFzfHf2HP8pasvCx7YXwM=;
 h=Date:To:From:Reply-To:Subject:From;
 b=kY5ZiAggHX6S77eItButb28B5N3iibRJDOHPZn9XDeBejtYakgdHFYf08xgmXTiHI
 ZTVZZ9c2khhqioMWyrJejViSJldOOynNlxFne9Fs9vtTX8oHMFIXobgkRsZNVJvwJj
 8+5sF9O/7V5H7dZ75zXD7jxmn0CQ65A9RgxMlbT3zmozfdn/JfYyMPpb0Pz5WKyVYk
 ZOgiaI6kCggcXIjsnTl9Ltkoj7ZUDxj5K93ho42fVoa7IMkVgv9zIwvXJC0GNnYd/5
 ckhCGLymSxciwlhtWRwY2IlUyNxUe3st5+/FBewnLI5TLm4crrnALdzJUYouzUPvkU
 XDd0q01TRluGQ==
To: wireguard@lists.zx2c4.com
From: "john@sys.casa" <john@sys.casa>
Subject: Invoking sendmmsg from Go.
Message-ID: <03143d09-112a-d28c-f79e-d97c01f7b1d2@sys.casa>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="------17e0beaa99168edc7eac863378bb27eb47662269685c67e155767195b63d9da8";
 charset=utf-8
X-Mailman-Approved-At: Wed, 01 Sep 2021 13:44:22 +0000
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
Reply-To: "john@sys.casa" <john@sys.casa>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------17e0beaa99168edc7eac863378bb27eb47662269685c67e155767195b63d9da8
Content-Type: multipart/mixed;
 boundary=982a140bbaaf3c4f05a46b968c9ee4ce1e7b2f88b727020733055f94b0fa
To: wireguard@lists.zx2c4.com
From: "john@sys.casa" <john@sys.casa>
Subject: Invoking sendmmsg from Go.
Message-ID: <03143d09-112a-d28c-f79e-d97c01f7b1d2@sys.casa>
Disposition-Notification-To: "john@sys.casa" <john@sys.casa>
Date: Tue, 31 Aug 2021 13:40:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US

--982a140bbaaf3c4f05a46b968c9ee4ce1e7b2f88b727020733055f94b0fa
Content-Transfer-Encoding: base64
Content-Disposition: 
Content-Type: text/plain; charset=UTF-8; format=flowed

SGV5IGZvbGtzOw0KDQpXaGlsZSByZWFkaW5nIHRocm91Z2ggc29tZSBvZiB0aGUgd2lyZWd1YXJk
LWdvIHNvdXJjZSBJIHNhdyB0aGVyZSBpcyBhIA0KVE9ETyB0byBpbXBsZW1lbnQ6DQoNCiDCoMKg
wqAgwqDCoMKgIC8vIA0KaHR0cHM6Ly9naXQuengyYzQuY29tL3dpcmVndWFyZC1nby90cmVlL3R1
bi90dW5fbGludXguZ28/aWQ9Mzk1N2U5YjlkZDE5I24zNTkNCiDCoMKgwqAgwqDCoMKgIGZ1bmMg
KHR1biAqTmF0aXZlVHVuKSBGbHVzaCgpIGVycm9yDQoNClRoZSBub3RlIHN1Z2dlc3RzIHVzaW5n
IHNlbmRtbXNnLCB3aGljaCwgZG9lcyBub3Qgc2VlbSB0byBiZSBpbXBsZW1lbnRlZCANCmJ5IHRo
ZSBzeXNjYWxsIHBhY2thZ2UgaW4gR28uIChodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lz
c3Vlcy85NDAyKQ0KDQpHaXZlbiB0aGF0LCBJIHdhcyB3b25kZXJpbmcgaWYgYW55Ym9keSBrbm93
cyBhIHdheSB0byBpbnRlcmZhY2Ugd2l0aCANCnNlbmRtbXNnIGZyb20gR28/DQoNCi0tIA0KUmVn
YXJkcywNCg0KSm9obiBTDQoNCg==
--982a140bbaaf3c4f05a46b968c9ee4ce1e7b2f88b727020733055f94b0fa
Content-Transfer-Encoding: base64
Content-Disposition: attachment; name="publickey - john@sys.casa -
 5550f851.asc"; filename="publickey - john@sys.casa - 5550f851.asc"
Content-Type: application/pgp-keys; name="publickey - john@sys.casa -
 5550f851.asc"; filename="publickey - john@sys.casa - 5550f851.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdvcGVuUEdQIDIu
MS45CkNvbW1lbnQ6IGh0dHBzOi8vZ29wZW5wZ3Aub3JnCgp4c0ZOQkdEaDdmQUJFQUNaNThNSVp2
M2NHMEljdVlOckpZekcwWWJ3K0xCbHJkWHpyYzJTYTRKRW03WGx2clJlCnhzU3o4YkczSXlVRkZM
RFNTNkI3em1JemlxY29YSlMxeHl3ZGVFWkxFZjRnY0pWZW9hRUE5ZGI4cnNaVi9XUkoKTGxqRmRF
U3VlTzZ3ZE5wSk4rNktBcUpIdExFRkZ5Zk5iM2txeGZoWk5aVTAxMmZtZksxdkRGUzMxRXdKdGRl
UAp3U1dYZkFWR3F1Q0dXZWVGNEkxbUFEZ2p2RG0wa1RIVFdZR3BXVkFtK1M0V1dnMXRxb05vTVY5
SVppSlJ4eTJyCklEQXZxZXNDTkdPK09xODBMaURDdk1mVlNzQzBvY2tXWDBrZXltWXJoNjFCbDRy
NTJiU3JiK0RiZ1JtNHhEZG8KaThkQ2RldTJjNUwveWFQa3FyTWdLUlBTeW5rWnBWZ2JBVi9xUUlz
REszaHJTZHRDZlIxWksrL1h5Vi81SHhsNQp5di83dHJ6bGFPa1RBUGRaSDltYmEwaTBVVks2Y2J4
VVdoRjZmS0JudktoVm83b3BmTEI5ekl4TFJTbVA2Y2NZCkg1U203dXhHemJ6MXJtVmNWZGE0dHRX
MXhncmtHNi9RaVRaTVVsNVZJVUV3Y3d6OUtOaGxabkNsV2tYRjlXYXIKWkgzeW9OM1AzZ2NqTkdG
SStwbitNL205WHhVWWhLVDdGS203K0NyR3lNYkdqVkh4T1pMems1YWQ4WVN2Q3FDVwpWb0FmNmZR
UkpjWGg4K3BFQSt6Yk94ZnBFY0tNaSs0NlNtb0tpbU9hU3ZMZE9KNTRtSDRJelVPZldwYnNBbFFy
ClNQMnRKdXZCcCthdDV2WGx5UU55Y25Vckt0aUJJNGtrOUdiVzhyWVZLM0s5bWo3TFAzbUtNZDRa
QndBUkFRQUIKelIxcWIyaHVRSE41Y3k1allYTmhJRHhxYjJodVFITjVjeTVqWVhOaFBzTEJqUVFR
QVFnQUlBVUNZT0h0OEFZTApDUWNJQXdJRUZRZ0tBZ1FXQWdFQUFoa0JBaHNEQWg0QkFDRUpFQXRV
amVLRXM1bFVGaUVFVlZENFVYbkZTbmtKCkhRNzlDMVNONG9Tem1WUjBBdy8vUWFMQjFLcEdRTVk1
ZmlxYzFRUTBCQXNSU1pLbitRZTJtQ0l6a0lGUm02S0wKRnFkWUIyRE5MSWxZYWM4MGFuTjJhaCs0
NHJVaHhHRlp0STZUVTFEL1pMRkhveXA1b1huUFlrdHQ3anNIS291egovd1JmT1EreGZsVXlPaklU
NmFzM2ZVUDJGNDRyRmp6STh5K0NUSXNRWU1uZk9zdHY1V0w2cVNMcm0yLzRHZk5YCmJlR0wwOTFw
cFFtNW1IaERFZXdlM3pEWlUwTjQ0c0krSUNKWXMzVFQ1SG13SDhJNnVTVGh3NGVWMVdMZ0Q4VS8K
UlpxSVJFcDNhRi96aXd5ME5QaW9wYzNLZHJLaGtZYVlPM1lVQ2tVY09PZEhmNG9vZG4zTk9DbWJB
c0IrcEFWYgpWQjBiVU5NZzM0ampVN0RVa0Z5a0ZDd0ZIeC94TW5KVk1FMGo5TXA1YVpjcWtDV3pa
RHhmbzA0ajI2bXpyMUtZCjE2YzZzbnVFVmNPRTNXY2tDVmU4TVg5a1JOZ01lem9sMmtYSUFCL1NE
emNUZ294VzVSNUxXMnFhaGJRNTN2bHIKbllZd3VZMVZrT2ZQVzNvcWVxMnhMZlVFQ1l1eU5LS0Q5
SnZSK0VZM0xqOHFzWi96a3ByWE92NlR3MzU2djdhYgplbmtEMlJwNnMya1RBUmFYOS9nKzlhQkIr
U2QxVVhOUXNKZ0doTHI4djJvQWJtRDEyOWVIRFFiUSt6K1JlTm5kCkpZc2lsNVFKdTM5S09oQjZR
UVZxd3FPZk9VZWh1SEJGZGEwTk5UMVFhZzR2d0o5bEZ4SG5oSSs4OEwzSTh4b2UKUU1UQ3hFUDJX
SHlqZnpGZzZ6d0p1Z0NnQ2NJS0J5azcyb2U1M25GVjFxSjczZm91QTVoanlzZ3k1cGEyWGdETwp3
VTBFWU9IdDhBRVFBTmxOWUU4NFdLTVV5WUtjQWhsVVJnWlJacThCTUt5d3pVcENLVWlJV2g1Z3BM
R3pzMTFICm9rd0h5OEdHWVdsVGNONTJQYXV6eFFFTUMraFYrNHArcXpURDlqZU5RV0syS3lWMEw3
YlNQUXhpR0ZlSi9MNloKYVlsTld0bW0vOXpTZTAxR2ljMWNaZTMyQTg5bGtNckVJaVh6bmp5bGZk
bTZiZ3V0c25oOUZ1L0lJSjliZGhWdQo5KzN5VGNtM1VWajZJWGxnN2xGZHJSeDdOcy9nNUN3cFNI
UnFzLzRXVXlnS29wRzR3YnhzdlcyUDMxZ1IxOUh1CkxNYldTVWVzVGY0TldxWmhSeXpaZ0wzMkkr
eTV1NG96WG53d3ErWDdXcnREeHRSM056RW9UNGFvcmRKWmk1YlYKUjdFQXVRVlp2cGFnNm5OVjB5
ZVVMTTAxNDBwTFFLd0lYdnVhTFhhcjV0cE1pZjhKN1A4dkJrWTYwc292Y2RMSQpiY09BclBsLy9u
Z0EyR2xKbHpncjc0WXUvQWNXV052ZW9rUFhISUFFTUhrYkhpVzhySHVDYmorcjcyZ0lZVi9SCjlP
d0dOUStRUUZualR5OW5YTVNmL3dMTnEzK0xqUjdQbkcwdWRDbktkZW01SFJ6YUY2dFZyZ21vL1Y2
SjBZeGEKWXpNb0l1S2drbXM2bm15R1M5NEh4RTROL050bDBQSWIxTm9raUdEZktpdUVRaVNqMVZm
K1hDQVcvbllxS05UZgpRSEdJcU5PNUhIVmRPUzVHL215dGNGcTg4TzV1VFo3dDJCczkrZGxrVUNO
clBqaHlwbkcrUDE1YVp6SWtVSExPCmJHYUMvWm5vL1VHNjl3cmFBZUJEYXZkMkRmY3lHbnF3UmlN
QkJyeWlZQ2NpV0pUeWtTS2JGM0tMQUJFQkFBSEMKd1hZRUdBRUlBQWtGQW1EaDdmQUNHd3dBSVFr
UUMxU040b1N6bVZRV0lRUlZVUGhSZWNWS2VRa2REdjBMVkkzaQpoTE9aVkozMkQvNG5OMGFpTXBI
NldYUjVNTnFGYjA5Qzg1ekpEZzJxVXhaclpCblVZc29idDl2eElZSDU4a2hGCmJsSWVRZTJZNzgz
L0haQ2g3WDYvMnR4cGwvQTV5SkQ1ME5GRUc5djlQSnhTZlIxS3p0ZFhaV0hmSkN3UEhHOHAKcGJ5
TnRYQVdsNU40c0NTN0p5SzQ4WjJIVngxT29wSmw1bHYrNWEvcmdKcUNUMkFnNUt2aDBWV3B0OGM1
MnErcAppcXFTc1d6akM1NjV5YUxPRWtpZ2dJMFJnWDZtVGxxRjNzVmw5a0FHRVlWbS9yUjdMNk5K
WGdCeHRjQTMxRDRVCkp2VklQYVZVZXV0UnpndVZUNm5yc2tWT3ZQMHhHUktZSVE1S2czNGhNNkFE
WEJJcXEzaEsvbmxSMG5UUEsvZysKQUQ5YVBCK0ptK1BIL2IwYm9TRnRHTlh1dXplbnBQa2xkWmJv
YjhjMDdKZGFjbVlGSE1QcElUU09LVTZwSTVlNQpTd1VlbjFsM1R0VkJJWjQ5RUc1aklOTktGbCtY
Z3grckRmN0RZUExGZy8veTIwRk1qM0MxamFMZ3NyY2pINlM0CmFNT2g5MHVjWFBmNFJJTU45VU1B
dUcrL3prYnpSNlVHRTlyY1M4RVRwWS9QaFJDVE5KUUhEYkVGeWE3MzBzV2UKVXpTRTA2cHA4eEFq
RDc0N0ROS0FiNzg4c2ZlWVozS2tGcCtQMXhEbEN6aVZrTTRyOUVOdUticlBqQjlZMXo0YQo0a1Qw
UlEvVXUvL2szbGJmL3pmYlJNSVk1Z3JwVThQNytPa3FxL0hua04yZmQxODlROU80TGQ0MnB3RDR3
akxqCklKazM4M21CZWErc0dkTndseUJERGE1Nlk2SWQ0SVZSNUdUNkY5aitXYXJTR29HY0hUMVE4
Zz09Cj1yK2MxCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--982a140bbaaf3c4f05a46b968c9ee4ce1e7b2f88b727020733055f94b0fa--

--------17e0beaa99168edc7eac863378bb27eb47662269685c67e155767195b63d9da8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsFzBAEBCAAnBQJhLmnJCRALVI3ihLOZVBYhBFVQ+FF5xUp5CR0O/QtUjeKE
s5lUAAAlDQ/+IyJqSnzC2r45zQJ5mKTNxn10BogtIx1qwBJXlP3WuceNXJmG
X1UXBb2cjL1+2krZ5rio755ZfztvGbx/1dV3ooXjSkq/Vhet57Q8gnD+zeea
c2cx+RZglm+sFUWDmURjNRjcvstGo/4MC0d9aKgXgN2lG+OAV7WspLyRFgjY
l9KJv6Akfai4c6E3QA8wQrDqYTPTU5H2IUsa6cfkMIZhHBEJo+te5WBDepRH
MRcATZEzUYJ7Shj0fnNpByyVupCKopJXsT0kogK1v440ZK1b8xbn22Q0NRTG
EAlsd18+gxNErtVgV4DaCmCSqZqpGTbMOGFv4fC0vILeXkAwcEzRW9W/52AU
HBVlLh1xzfnGo+ILpZxBhzgGHfqnnHXQBkOKWuz0i24vlMLOO8IQPESb7hGI
DAu4+N6QlftPwlPwI0QNZmB3216ZduOMn91hm5DOqEkMVI1s52+Pig3yz+z8
U3PiwgwoKArMBmff7bQEx78PJ1PXK8D7gcX19Rp447M2wANR8DTBTYzA0pDn
1hX6kvU2DI8uw1xgyUZokt1EJ/WTsWAT0y1aRA1mMy6k41IStR45sSDujfcC
HbafZ6uJ82SOmwZAOx4BXutYiUPb4v5qN6pmjJAMN6HylH5F7LehWk+zwzDO
6pPW5Kn1HXFbq5WLoBBfb2i0i+Es6ZIlRmg=
=gxYV
-----END PGP SIGNATURE-----


--------17e0beaa99168edc7eac863378bb27eb47662269685c67e155767195b63d9da8--

